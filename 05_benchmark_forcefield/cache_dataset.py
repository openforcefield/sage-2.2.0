from yammbs.cached_result import CachedResultCollection,CachedResult
from openff.qcsubmit.results import OptimizationResultCollection
import logging
import sys
import json
import multiprocessing
import tqdm
import qcportal

logging.getLogger('openff').setLevel(logging.ERROR)


def split_dataset_batch(dataset,n=1):
    ds = dict(dataset)['entries']["https://api.qcarchive.molssi.org:443/"]
    n_keys = len(ds)
    group_size = int(n_keys/n)+1 

    split_datasets = []
    for group_idx in range(0,n):
        split_datasets.append(OptimizationResultCollection(entries={"https://api.qcarchive.molssi.org:443/": ds[group_idx*group_size:(group_idx+1)*group_size]}))

    return split_datasets




def main(dataset,cache_file,n_procs=1,batch_size=500):
    ds = OptimizationResultCollection.parse_file(dataset)
    print('Loaded dataset.',flush=True)
    
    split_ds = split_dataset_batch(ds,batch_size)
    print("Split dataset",flush=True)
    print('Number of entries in initial DS: ', ds.n_results,flush=True)
    print('Number of entries in split DS:   ', sum([split_ds[i].n_results for i in range(0,len(split_ds))]),flush=True)
    print('Size of each batch:              ', [split_ds[i].n_results for i in range(0,len(split_ds))],flush=True)
    
    
    print('Starting cache',flush=True)
    cache = []
    with multiprocessing.Pool(n_procs) as pool:
        for x in tqdm.tqdm(pool.imap(CachedResultCollection.from_qcsubmit_collection,split_ds),desc='Caching dataset',total = len(split_ds)):
            cache.extend(x.inner) # "inner" is the internal list of cached results
            #except qcportal.client_base.PortalRequestError:
            #    print("Error connecting to server")
            #    split_ds.append(
    
    print('Done making cache',flush=True)
    
    with open(cache_file,'w') as writefile:
        jsondata = json.dumps(cache,default=CachedResult.to_dict,indent=2)
        writefile.write(jsondata)#(cache.to_json(indent=2))

    test = CachedResultCollection.from_json(cache_file)


if __name__ == '__main__':

    n_procs = int(sys.argv[1])
    
    dataset = "datasets/OpenFF-Industry-Benchmark-Season-1-v1.1-filtered-charge-coverage.json"
    cache_file = "datasets/OpenFF-Industry-Benchmark-Season-1-v1.1-filtered-charge-coverage-cache.json"
    #dataset = "datasets/OpenFF_Gen_2_Opt_Set_1_Roche-filtered.json"
    #cache_file = 'datasets/OpenFF_Gen_2_Opt_Set_1_Roche-filtered-cache.json'
    main(dataset,cache_file,n_procs=n_procs,batch_size=500)
