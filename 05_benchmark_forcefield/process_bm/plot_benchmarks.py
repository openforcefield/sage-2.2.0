import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import seaborn as sns
import sys
import click
import os

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

def print_stats(datasets,labels,outlier_low=False,outlier_high=False):
    # print('Stats:')
    print('{:<25s}   {:>8s} {:>10s} {:>10s} {:>8s} {:>8s} {:>8s} {:>8s} {:>8s}'.format('Dataset','Size','Min','Max','MSE','MAE','Median','STD','# outliers'))
    longest_label = max([len(label) for label in labels])
    # print(longest_label)
    outliers = get_outliers(datasets,labels,artificial_low=outlier_low,artificial_high=outlier_high)
    for i,data in enumerate(datasets):

        print('{:<25s}   {:>-8d} {:>-10.4f} {:>-10.4f} {:>-8.5f} {:>-8.5f} {:>-8.5f} {:>-8.5f} {:>-8d}'.format(labels[i],data.shape[0],data.min(),data.max(),data.mean(),mae(data),np.median(data),data.std(),outliers[i]))


def boxplot(datasets,labels,filename,title=''):
    data_dict = {label:datasets[i] for i,label in enumerate(labels)}
    plt.figure()
    sns.boxplot(data=pd.DataFrame(data_dict))
    plt.title(title)
    plt.savefig(filename)

def plot_log_kde(datasets,labels,filename,title='Industry dataset',bw=1,xlim=[-2,2],xlabel='RMSD (Log A)'):
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
    boxplot(all_data,all_data_names,dir+'{}_sage220_boxplot.pdf'.format(type),xlabel=xlab)
    plt.close()

def plot_dde(all_data,all_data_names,dir):
    plot_hist(all_data,all_data_names,dir+'dde_sage220_hist.pdf')
    plt.close()
    plot_hist(all_data,all_data_names,dir+'dde_sage220_hist_zoom.pdf',xlim=[-0.5,0.5],ylim=[16500,17500],lw=2)
    plt.close()
    plot_kde(all_data,all_data_names,dir+'dde_sage220_kde.pdf')
    plt.close()
    boxplot(all_data,all_data_names,dir+'dde_sage220_boxplot.pdf')
    plt.close()

def plot_conf_filter(kept_by_filter,filtered_out,all_data_names,dir,filter_pattern,type='rmsd'):

    if type == 'tfd':
        xlab = 'TFD'
    else:
        xlab = "RMSD (Log A)"

    title = 'Molecules with {}'.format(filter_pattern)
    plot_log_kde(kept_by_filter,all_data_names,dir+'{}_sage220_{}_kde.pdf'.format(type,filter_pattern),title=title,xlabel=xlab)
    plt.close()
    boxplot(kept_by_filter,all_data_names,dir+'{}_sage220_{}_boxplot.pdf'.format(type,filter_pattern),title=title,xlabel=xlab)
    plt.close()

    title = 'Molecules without {}'.format(filter_pattern)
    plot_log_kde(filtered_out,all_data_names,dir+'{}_sage220_{}_kde.pdf'.format(type,filter_pattern),title=title,xlabel=xlab)
    plt.close()
    boxplot(filtered_out,all_data_names,dir+'{}_sage220_{}_boxplot.pdf'.format(type,filter_pattern),title=title,xlabel=xlab)
    plt.close()

def plot_dde_filter(kept_by_filter,filtered_out,all_data_names,dir,filter_pattern):
    # kept by filter
    title = 'Molecules with {}'.format(filter_pattern)
    plot_hist(kept_by_filter,all_data_names,dir+'dde_sage220_{}_hist.pdf'.format(filter_pattern),title=title)
    plt.close()
    plot_hist(kept_by_filter,all_data_names,dir+'dde_sage220_{}_hist_zoom.pdf'.format(filter_pattern),xlim=[-0.5,0.5],ylim=[16500,17500],lw=2,title=title)
    plt.close()
    plot_kde(kept_by_filter,all_data_names,dir+'dde_sage220_{}_kde.pdf'.format(filter_pattern),title=title)
    plt.close()
    boxplot(kept_by_filter,all_data_names,dir+'dde_sage220_{}_boxplot.pdf'.format(filter_pattern),title=title)
    plt.close()

    title = 'Molecules without {}'.format(filter_pattern)
    plot_hist(filtered_out,all_data_names,dir+'dde_sage220_{}fo_hist.pdf'.format(filter_pattern),title=title)
    plt.close()
    plot_hist(filtered_out,all_data_names,dir+'dde_sage220_{}fo_hist_zoom.pdf'.format(filter_pattern),xlim=[-0.5,0.5],ylim=[16500,17500],lw=2,title=title)
    plt.close()
    plot_kde(filtered_out,all_data_names,dir+'dde_sage220_{}fo_kde.pdf'.format(filter_pattern),title=title)
    plt.close()
    boxplot(filtered_out,all_data_names,dir+'dde_sage220_{}fo_boxplot.pdf'.format(filter_pattern),title=title)
    plt.close()

# def plot_dde()

def filter_data(datasets,dataset_ids,filter_ids):
    sage_ids = dataset_ids[0] # Assume Sage is first
    # print(dataset_ids[1])
    # print(sage_ids)
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

    all_data_covered = []
    all_data_notcovered = []
    all_ids_covered = []
    all_ids_notcovered = []
    for i,data in enumerate(datasets):
        assert np.all(dataset_ids[i]==sage_ids) # Make sure they're all in the same order

        all_data_covered.append(data[covered_idx]) # data that includes the filtered IDS
        all_data_notcovered.append(data[not_covered_idx]) # data that does not include the filtere IDs
        all_ids_covered.append(dataset_ids[i][covered_idx])
        all_ids_notcovered.append(dataset_ids[i][not_covered_idx])

    return all_data_covered,all_data_notcovered,all_ids_covered,all_ids_notcovered

def main_filter(dir,all_data,all_data_names,all_ids,filter_file,filter_pattern,type): # outliers have already been excluded
    dir = dir+filter_pattern+'/'
    if not os.path.isdir(dir):
    # except FileNotFoundError:
        os.mkdir(dir)
    dir += type+'/'
    if not os.path.isdir(dir): # make parent dir if necessary
    # except FileNotFoundError:
        os.mkdir(dir)


    print('Filtering dataset')
    kept_by_filter,filtered_out,kept_ids,filtered_out_ids = filter_data(all_data,all_ids,[filter_file])
    print('Number of molecules kept by filter: ',len(kept_ids[0]))
    print('Number of molecules filtered out: ',len(filtered_out_ids[0]))
    print()

    print()
    print('Stats for molecules that include {}'.format(filter_pattern))
    print_stats(kept_by_filter,all_data_names)
    print()
    print("Stats for molecules that don't include {}".format(filter_pattern))
    print_stats(filtered_out,all_data_names)

    print('Saving plots to ', dir)
    if type == 'dde':
        plot_dde_filter(all_data,all_data_names,dir)
    else:
        plot_conf_filter(all_data,all_names,dir,type=type)

def main_nofilter(dir,all_data,all_data_names,type):
    dir += type+'/'
    if not os.path.isdir(dir): # make parent dir if necessary
    # except FileNotFoundError:
        os.mkdir(dir)


    print('Saving plots to ', dir)
    if type == 'dde':
        plot_dde(all_data,all_data_names,dir)
    else == 'rmsd':
        plot_conf(all_data,all_names,dir,type=type)


@click.command()
@click.option('--dir',default='./',help='Directory to save plots to')
@click.option('--outlier_files',default=[],multiple=True,help='File with outlier IDs to filter out')
@click.option('--filter_file',default=False,help='File with IDs of records to filter. Should contain molecules kept by filter. ')
@click.option('--filter_pattern',default=False,help='Description of filter to be used for titles etc')
@click.option('--type',type=click.Choice(['dde','rmsd','tfd']),default='dde',help='Property to plot')
def main(dir,outlier_files,filter_file,filter_pattern):
    # Load in data
    sage_200_ids,sage_200_datas = np.loadtxt('./sage/sage-industry-output/{}.csv'.format(type),delimiter = ',',skiprows=1,unpack=True)
    sage_210_ids,sage_210_datas = np.loadtxt('./smring_543internal_4sideog/industry-output/{}.csv'.format(type),delimiter = ',',skiprows=1,unpack=True)
    sage_220_ids,sage_220_datas = np.loadtxt('./smring_543internal_4sidegeneric/industry-output/{}.csv'.format(type),delimiter = ',',skiprows=1,unpack=True)

    all_data = [sage_200_datas,sage_210_datas,sage_220_datas]
    all_ids = [sage_200_ids,sage_210_ids,sage_220_ids]
    all_data_names = ['Sage 2.0.0','Sage 2.1.0','Sage 2.2.0']

    # make sure we can use dir by adding a slash and making the directory if necessary
    if dir[-1] != '/':
            dir += '/'

    if not os.path.isdir(dir): # make parent dir if necessary
    # except FileNotFoundError:
        os.mkdir(dir)

    if len(outlier_files)>0:
        dir += 'outliers_removed/'
        if not os.path.isdir(dir): # make parent dir if necessary
        # except FileNotFoundError:
            os.mkdir(dir)

        print('Excluding outliers: ',outlier_files)
        all_outliers,all_data,all_outlier_ids,all_ids = filter_data(all_data,all_ids,outlier_files)
        print('Stats for all data, with outliers excluded:')
        # dir += 'outliers'
    else:
        print('Stats for all data:')
    print_stats(all_data,all_data_names)

    if filter_file:
        main_filter(dir,all_data,all_data_names,all_ids,filter_file,filter_pattern,type)
    else:
        main_nofilter(dir,all_data,all_data_names,type)

#dde
if __name__ == '__main__':

    main()
