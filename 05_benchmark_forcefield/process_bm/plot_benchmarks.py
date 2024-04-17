import matplotlib.pyplot as plt
import numpy as np
import warnings

with warnings.catch_warnings():
    warnings.filterwarnings("ignore",category=DeprecationWarning)
    import pandas as pd

import seaborn as sns
import sys
import click
import os
# import warnings
warnings.filterwarnings(
    "ignore", message="divide by zero", category=RuntimeWarning
)

def plot_hist(datasets,labels,filename,title='Industry dataset',xlim=[-2,2],ylim=False,legend=True,lw=1):
    plt.figure()
    plt.axvline(x=0,linestyle='--',color='k',linewidth=0.5)
    for i,data in enumerate(datasets):
        plt.hist(data,histtype='step',bins=400,range=(-100.25,99.75),label=labels[i],linewidth=lw)

    plt.xlim(xlim[0],xlim[1])
    plt.title(title)
    plt.ylabel('Count')
    plt.xlabel('DDE (kcal/mol)')
    if legend: plt.legend()
    if np.any(ylim): plt.ylim(ylim[0],ylim[1])
    plt.savefig(filename)

def plot_kde(datasets,labels,filename,title='Industry dataset',bw=1,xlim=[-2,2]):
    if bw > .5:
        gs = 1
    elif bw > .2:
        gs = 2
    else:
        gs = 3

    # Industry
    plt.figure()
    plt.axvline(x=0,linestyle='--',color='k',linewidth=0.5)
    for i,data in enumerate(datasets):
        sns.kdeplot(data,bw_adjust=bw,gridsize=10000*gs,label=labels[i])

    plt.xlim(xlim[0],xlim[1])
    plt.title(title)
    plt.ylabel('Density')
    plt.xlabel('DDE (kcal/mol)')
    plt.legend()
    plt.savefig(filename)

def mae(array):
    return np.abs(array).mean()

def get_outliers(all_data,all_data_names,artificial_low=False,artificial_high=False):
    # Get actual outliers--molecules that are outside the IQR
    outlier_ns = []
    for i,data in enumerate(all_data):
        q1, q3 = np.percentile(data, [25, 75])
        whisker_low = q1 - (q3 - q1) * 1.5
        whisker_high = q3 + (q3 - q1) * 1.5
        if artificial_low: whisker_low = artificial_low
        if artificial_high: whisker_high = artificial_high
        outliers = data[(data > whisker_high) | (data < whisker_low)]
        # outlier_ids = all_ids[i][(data > whisker_high) | (data < whisker_low)]
        # if save: np.savetxt(all_data_names[i]+'_outlierids.txt',outlier_ids,fmt='%i')
        outlier_ns.append(outliers.shape[0])
    return outlier_ns

def print_stats(datasets,labels,lines,outlier_low=False,outlier_high=False):
    # print(datasets)
    # print('Stats:')
    lines.append('{:<25s}   {:>8s} {:>10s} {:>10s} {:>8s} {:>8s} {:>8s} {:>8s} {:>8s}'.format('Dataset','Size','Min','Max','MSE','MAE','Median','STD','# outliers'))
    longest_label = max([len(label) for label in labels])
    # print(longest_label)
    outliers = get_outliers(datasets,labels,artificial_low=outlier_low,artificial_high=outlier_high)
    for i,data in enumerate(datasets):
        # print(data)

        lines.append('{:<25s}   {:>-8d} {:>-10.4f} {:>-10.4f} {:>-8.5f} {:>-8.5f} {:>-8.5f} {:>-8.5f} {:>-8d}'.format(labels[i],data.shape[0],data.min(),data.max(),data.mean(),mae(data),np.median(data),data.std(),outliers[i]))


def boxplot(datasets,labels,filename,title=''):
    data_dict = {label:datasets[i] for i,label in enumerate(labels)}
    plt.figure()
    sns.boxplot(data=pd.DataFrame(data_dict))
    plt.title(title)
    plt.savefig(filename)

def plot_log_kde(datasets,labels,filename,title='Industry dataset',bw=1,xlim=[-2,1],xlabel='RMSD (Log A)'):
    if bw > .5:
        gs = 1
    elif bw > .2:
        gs = 2
    else:
        gs = 3

    # Industry
    plt.figure()
    plt.axvline(x=0,linestyle='--',color='k',linewidth=0.5)
    for i,data in enumerate(datasets):
        sns.kdeplot(np.log10(data),bw_adjust=bw,gridsize=10000*gs,label=labels[i])

    plt.xlim(xlim[0],xlim[1])
    plt.title(title)
    plt.ylabel('Density')
    plt.xlabel('Log10 '+xlabel)
    plt.legend()
    plt.savefig(filename)
    plt.close()

def plot_conf(all_data,all_data_names,dir,type='rmsd'):
    if type == 'tfd':
        xlab = 'TFD'
    else:
        xlab = "RMSD (Log A)"
    plot_log_kde(all_data,all_data_names,dir+'{}_sage220_kde.pdf'.format(type),xlabel=xlab)
    plt.close()
    try:
        boxplot(all_data,all_data_names,dir+'{}_sage220_boxplot.pdf'.format(type))
        plt.close()
    except ValueError:
        pass

def plot_dde(all_data,all_data_names,dir,type,ic_type,xlim=[-2,2]):
    if type == 'dde':
        plttype = 'dde'
    elif type == 'icrmsd':
        plttype = ic_type
        xlim = [0.9*min([dat.min() for dat in all_data]),max([dat.max() for dat in all_data])*1.1]
    #try:
    #    plot_hist(all_data,all_data_names,dir+'{}_sage220_hist.pdf'.format(plttype),xlim=xlim)
    #    plt.close()
    #    plot_hist(all_data,all_data_names,dir+'{}_sage220_hist_zoom.pdf'.format(plttype),xlim=[-0.5,0.5],lw=2)
    #    plt.close()
    #    plot_kde(all_data,all_data_names,dir+'{}_sage220_kde.pdf'.format(plttype),xlim=xlim)
    #    plt.close()
    #except ValueError:
    #    pass
    try:
        boxplot(all_data,all_data_names,dir+'{}_sage220_boxplot.pdf'.format(plttype))
        plt.close()
    except ValueError as e:
        print(e)
        print([d.shape for d in all_data])
        pass

def plot_conf_filter(kept_by_filter,filtered_out,all_data_names,dir,filter_pattern,type='rmsd'):

    if type == 'tfd':
        xlab = 'TFD'
    else:
        xlab = "RMSD (Log A)"

    title = 'Molecules with {}'.format(filter_pattern)
    plot_log_kde(kept_by_filter,all_data_names,dir+'{}_sage220_{}_kde.pdf'.format(type,filter_pattern),title=title,xlabel=xlab)
    plt.close()
    boxplot(kept_by_filter,all_data_names,dir+'{}_sage220_{}_boxplot.pdf'.format(type,filter_pattern),title=title)
    plt.close()

    title = 'Molecules without {}'.format(filter_pattern)
    plot_log_kde(filtered_out,all_data_names,dir+'{}_sage220_{}fo_kde.pdf'.format(type,filter_pattern),title=title,xlabel=xlab)
    plt.close()
    boxplot(filtered_out,all_data_names,dir+'{}_sage220_{}fo_boxplot.pdf'.format(type,filter_pattern),title=title)
    plt.close()

def plot_dde_filter(kept_by_filter,filtered_out,all_data_names,dir,filter_pattern,type,ic_type):
    if type == 'dde':
        plttype = 'dde'
    elif type == 'icrmsd':
        plttype = ic_type

    # kept by filter
    title = 'Molecules with {}'.format(filter_pattern)
    plot_hist(kept_by_filter,all_data_names,dir+'{}_sage220_{}_hist.pdf'.format(plttype,filter_pattern),title=title)
    plt.close()
    plot_hist(kept_by_filter,all_data_names,dir+'{}_sage220_{}_hist_zoom.pdf'.format(plttype,filter_pattern),xlim=[-0.5,0.5],lw=2,title=title)
    plt.close()
    plot_kde(kept_by_filter,all_data_names,dir+'{}_sage220_{}_kde.pdf'.format(plttype,filter_pattern),title=title)
    plt.close()
    try:
        boxplot(kept_by_filter,all_data_names,dir+'{}_sage220_{}_boxplot.pdf'.format(plttype,filter_pattern),title=title)
        plt.close()
    except ValueError:
        pass

    title = 'Molecules without {}'.format(filter_pattern)
    plot_hist(filtered_out,all_data_names,dir+'{}_sage220_{}fo_hist.pdf'.format(plttype,filter_pattern),title=title)
    plt.close()
    plot_hist(filtered_out,all_data_names,dir+'{}_sage220_{}fo_hist_zoom.pdf'.format(plttype,filter_pattern),xlim=[-0.5,0.5],lw=2,title=title)
    plt.close()
    plot_kde(filtered_out,all_data_names,dir+'{}_sage220_{}fo_kde.pdf'.format(plttype,filter_pattern),title=title)
    plt.close()
    try:
        boxplot(filtered_out,all_data_names,dir+'{}_sage220_{}fo_boxplot.pdf'.format(plttype,filter_pattern),title=title)
        plt.close()
    except ValueError:
        pass

# def plot_dde()

def filter_data_difsize(datasets,dataset_ids,filter_ids,lines):#,rmsd_filter_idx):
    lines.append("Data has different sizes, filtering datasets individually")
    # loop through datasets
    all_data_covered = []
    all_data_notcovered = []
    all_ids_covered = []
    all_ids_notcovered = []
    filter_id_files = [np.loadtxt(file) for file in filter_ids]
    for i,data in enumerate(datasets):
        did = np.array(dataset_ids[i])

        # print(data.shape)
        # print(did.shape)
        # print(rmsd_idx.shape)
        # print(np.count_nonzero(rmsd_idx))

        # loop through filter files--maybe not the most efficient
        n_data_flag = False
        for filter_id in filter_id_files:
            # filter_id = np.loadtxt(filter_id_file)

            # print(filter_id)
            if n_data_flag: # if we've already filtered once, need to add these in
                covered_idx = np.logical_or(covered_idx,np.array([i in filter_id for i in did]))
            else:
                covered_idx = np.array([i in filter_id for i in did])
                n_data_flag = True

        # print(covered_idx.shape)
        # these will just be all "True" if no rmsd filter, so should be OK
        not_covered_idx = np.logical_not(covered_idx)#[rmsd_idx]
        covered_idx = covered_idx#[rmsd_idx]
        # print(covered_idx.shape)

        # don't need to do any asserting since we are doing each one in its own order
        all_data_covered.append(data[covered_idx]) # data that includes the filtered IDS
        all_data_notcovered.append(data[not_covered_idx]) # data that does not include the filtere IDs
        all_ids_covered.append(did[covered_idx])#[rmsd_idx][covered_idx])
        all_ids_notcovered.append(did[not_covered_idx])#[rmsd_idx][not_covered_idx])

    return all_data_covered,all_data_notcovered,all_ids_covered,all_ids_notcovered

def filter_data(datasets,dataset_ids,filter_ids,lines): #,rmsd_filter_idx):
    try:
        sage_ids = dataset_ids[0] # Assume Sage is first

        n_data_flag = False
        # loop through all filter ID files
        for filter_id_file in filter_ids:
            filter_id = np.loadtxt(filter_id_file)

            # print(filter_id)
            if n_data_flag: # if we've already filtered once, need to add these in
                covered_idx = np.logical_or(covered_idx,np.array([i in filter_id for i in sage_ids]))
            else:
                covered_idx = np.array([i in filter_id for i in sage_ids])
                n_data_flag = True

        not_covered_idx = np.logical_not(covered_idx)

        # all_covered_idx = [covered_idx[rmsd_idx] for rmsd_idx in rmsd_filter_idx]
        # all_not_covered_idx = [not_covered_idx[rmsd_idx] for rmsd_idx in rmsd_filter_idx]
        # for x in all_covered_idx:
        #     print(x.shape)

        all_data_covered = []
        all_data_notcovered = []
        all_ids_covered = []
        all_ids_notcovered = []
        for i,data in enumerate(datasets):
            # covered_idx = all_covered_idx[i]
            # not_covered_idx = all_not_covered_idx[i]
            assert np.all(dataset_ids[i]==sage_ids) # Make sure they're all in the same order

            all_data_covered.append(data[covered_idx]) # data that includes the filtered IDS
            all_data_notcovered.append(data[not_covered_idx]) # data that does not include the filtere IDs
            all_ids_covered.append(dataset_ids[i][covered_idx])
            all_ids_notcovered.append(dataset_ids[i][not_covered_idx])

        return all_data_covered,all_data_notcovered,all_ids_covered,all_ids_notcovered
    except (ValueError,IndexError):
        return filter_data_difsize(datasets,dataset_ids,filter_ids,lines)#,rmsd_filter_idx)



def main_filter(dir,all_data,all_data_names,all_ids,filter_file,filter_pattern,type,ic_type,lines):#,rmsd_idx): # outliers have already been excluded
    dir = dir+filter_pattern+'/'
    if not os.path.isdir(dir):
    # except FileNotFoundError:
        os.mkdir(dir)
    dir += type+'/'
    if not os.path.isdir(dir): # make parent dir if necessary
    # except FileNotFoundError:
        os.mkdir(dir)


    lines.append('Filtering dataset')
    kept_by_filter,filtered_out,kept_ids,filtered_out_ids = filter_data(all_data,all_ids,filter_file,lines)#,rmsd_idx)
    lines.append('Number of molecules kept by filter: ' + str(len(kept_ids[0])))
    lines.append('Number of molecules filtered out: ' + str(len(filtered_out_ids[0])))
    lines.append('')

    lines.append('')
    lines.append('Stats for molecules that include {}'.format(filter_pattern))
    print_stats(kept_by_filter,all_data_names,lines)
    lines.append('')
    lines.append("Stats for molecules that don't include {}".format(filter_pattern))
    print_stats(filtered_out,all_data_names,lines)

    lines.append('Saving plots to '+ dir)

    if type == 'icrmsd':
        with open(dir+'/'+type+'_'+ic_type+'.log','w') as writefile:
            for line in lines:
                writefile.write(line+'\n')
    else:
        with open(dir+'/'+type+'.log','w') as writefile:
            for line in lines:
                writefile.write(line+'\n')

    if type == 'dde' or type == 'icrmsd':
        plot_dde_filter(kept_by_filter,filtered_out,all_data_names,dir,filter_pattern,type,ic_type)
    else:
        plot_conf_filter(kept_by_filter,filtered_out,all_data_names,dir,filter_pattern,type=type)

def main_nofilter(dir,all_data,all_data_names,type,ic_type,lines):
    dir += type+'/'
    if not os.path.isdir(dir): # make parent dir if necessary
    # except FileNotFoundError:
        os.mkdir(dir)

    lines.append('Saving plots to '+ dir)

    if type == 'icrmsd':
        with open(dir+'/'+type+'_'+ic_type+'.log','w') as writefile:
            for line in lines:
                writefile.write(line+'\n')
    else:
        with open(dir+'/'+type+'.log','w') as writefile:
            for line in lines:
                writefile.write(line+'\n')

    if type == 'dde' or type == 'icrmsd':
        plot_dde(all_data,all_data_names,dir,type,ic_type)
    else:
        plot_conf(all_data,all_data_names,dir,type=type)

@click.command()
@click.option('--dir',default='./',help='Directory to save plots to')
@click.option('--problem_files',default=[],multiple=True,help='File with problem IDs to filter out')
@click.option('--filter_file',default=[],multiple=True,help='File with IDs of records to filter. Should contain molecules kept by filter. ')
@click.option('--filter_pattern',default=None,help='Description of filter to be used for titles etc')
@click.option('--type',type=click.Choice(['dde','rmsd','tfd','icrmsd']),default='dde',help='Property to plot')
@click.option('--rmsd_filter',help='Whether to filter benchmarks by large RMSD')
@click.option('--ic_type',type=click.Choice(['bond','angle','dihedral','improper']),default='bond',help='which ICRMSD to plot')
def main(dir,problem_files,filter_file,filter_pattern,type,rmsd_filter,ic_type):
    # start keeping track of lines for a log file
    lines = []
    # make sure we can use dir by adding a slash and making the directory if necessary
    if dir[-1] != '/':
            dir += '/'

    if not os.path.isdir(dir): # make parent dir if necessary
    # except FileNotFoundError:
        os.mkdir(dir)

    if type == 'icrmsd':
        icrmsd_idx = {'bond':0,'angle':1,'dihedral':2,'improper':3}[ic_type] + 1
    else:
        icrmsd_idx = 1


    # Load in data
    sage_200_ids,sage_200_data = np.genfromtxt('../openff_unconstrained-2.0.0/{}.csv'.format(type),delimiter = ',',skip_header=1,missing_values='',unpack=True,usecols=(0,icrmsd_idx))
    sage_210_ids,sage_210_data = np.genfromtxt('../openff_unconstrained-2.1.0/{}.csv'.format(type),delimiter = ',',skip_header=1,missing_values='',unpack=True,usecols=(0,icrmsd_idx))
    sage_220_ids,sage_220_data = np.genfromtxt('../openff_unconstrained-2.2.0-rc1/{}.csv'.format(type),delimiter = ',',skip_header=1,missing_values='',unpack=True,usecols=(0,icrmsd_idx))

    rmsd_idx = [np.full(sage_200_ids.shape, True),np.full(sage_210_ids.shape, True),np.full(sage_220_ids.shape, True)]
    if rmsd_filter:
        dir += 'rmsd_filter/'
        if not os.path.isdir(dir):
            os.mkdir(dir)

        lines.append('Filtering out entries with RMSD > 0.4 A'.format(type))
        sage_200_rmsd_ids,sage_200_rmsds = np.loadtxt('../openff_unconstrained-2.0.0/rmsd.csv',delimiter = ',',skiprows=1,unpack=True)
        sage_210_rmsd_ids,sage_210_rmsds = np.loadtxt('../openff_unconstrained-2.1.0/rmsd.csv',delimiter = ',',skiprows=1,unpack=True)
        sage_220_rmsd_ids,sage_220_rmsds = np.loadtxt('../openff_unconstrained-2.2.0-rc1/rmsd.csv',delimiter = ',',skiprows=1,unpack=True)

        # indices for data to keep--with rmsd < 0.4
        sage_200_lgrmsd_idx = sage_200_rmsds < 0.4
        sage_210_lgrmsd_idx = sage_210_rmsds < 0.4
        sage_220_lgrmsd_idx = sage_220_rmsds < 0.4
        # make sure all the entries are present in all files
        if len(sage_200_rmsd_ids) != len(sage_200_ids):
            if len(sage_200_rmsd_ids) > len(sage_200_ids):
                keep_ids_200 = [id in sage_200_ids for id in sage_200_rmsd_ids]
                sage_200_rmsds = sage_200_rmsds[keep_ids_200]
                sage_200_lgrmsd_idx = sage_200_lgrmsd_idx[keep_ids_200]
            else:
                keep_ids_200 = [id in sage_200_rmsd_ids for id in sage_200_ids]
                sage_200_data = sage_200_data[keep_ids_200]

        if len(sage_210_rmsd_ids) != len(sage_210_ids):
            if len(sage_210_rmsd_ids) > len(sage_210_ids):
                keep_ids_210 = [id in sage_210_ids for id in sage_210_rmsd_ids]
                sage_210_rmsds = sage_210_rmsds[keep_ids_210]
                sage_210_lgrmsd_idx = sage_210_lgrmsd_idx[keep_ids_210]
            else:
                keep_ids_210 = [id in sage_210_rmsd_ids for id in sage_210_ids]
                sage_210_data = sage_210_data[keep_ids_210]


        if len(sage_220_rmsd_ids) != len(sage_220_ids):
            if len(sage_220_rmsd_ids) > len(sage_220_ids):
                keep_ids_220 = [id in sage_220_ids for id in sage_220_rmsd_ids]
                sage_220_rmsds = sage_220_rmsds[keep_ids_220]
                sage_220_lgrmsd_idx = sage_220_lgrmsd_idx[keep_ids_220]
            else:
                keep_ids_220 = [id in sage_220_rmsd_ids for id in sage_220_ids]
                sage_220_data = sage_220_data[keep_ids_220]


        sage_200_data = sage_200_data[sage_200_lgrmsd_idx]
        sage_210_data = sage_210_data[sage_210_lgrmsd_idx]
        sage_220_data = sage_220_data[sage_220_lgrmsd_idx]
        rmsd_idx = [sage_200_lgrmsd_idx,sage_210_lgrmsd_idx,sage_220_lgrmsd_idx]
        lines.append('Number of entries remaining: '+','.join([str(np.count_nonzero(x)) for x in rmsd_idx]))

    print(sage_200_data.shape,sage_210_data.shape,sage_220_data.shape)

    all_data = [sage_200_data[~np.isnan(sage_200_data)],sage_210_data[~np.isnan(sage_210_data)],sage_220_data[~np.isnan(sage_220_data)]]
    all_ids = [sage_200_ids[rmsd_idx[0]][~np.isnan(sage_200_data)],sage_210_ids[rmsd_idx[1]][~np.isnan(sage_210_data)],sage_220_ids[rmsd_idx[2]][~np.isnan(sage_220_data)]]
    all_data_names = ['Sage 2.0.0','Sage 2.1.0','Sage 2.2.0']

    # hack for now
    #all_data = [sage_200_data,sage_210_data,sage_220_data]
    #all_ids = [sage_200_ids,sage_210_ids,sage_220_ids]

    print(np.sum(~np.isnan(sage_200_data)),np.sum(~np.isnan(sage_210_data)),np.sum(~np.isnan(sage_220_data)))

    # print(np.mean(all_data[0][0:5]),np.mean(all_data[0][0:2]))

    if len(problem_files)>0:
        dir += 'problems_removed/'
        if not os.path.isdir(dir): # make parent dir if necessary
        # except FileNotFoundError:
            os.mkdir(dir)

        lines.append('Excluding problem molecules: '+str(problem_files))
        all_outliers,all_data,all_outlier_ids,all_ids = filter_data(all_data,all_ids,problem_files,lines)#,rmsd_idx)
        lines.append('Stats for all data, with problem molecules excluded:')
        # dir += 'outliers'
    else:
        lines.append('Stats for all data:')
    print_stats(all_data,all_data_names,lines)

    # print(filter_file,len(filter_file))
    if len(filter_file)>0:
        main_filter(dir,all_data,all_data_names,all_ids,filter_file,filter_pattern,type,ic_type,lines)#,rmsd_idx)
    else:
        main_nofilter(dir,all_data,all_data_names,type,ic_type,lines)



#dde
if __name__ == '__main__':

    main()
