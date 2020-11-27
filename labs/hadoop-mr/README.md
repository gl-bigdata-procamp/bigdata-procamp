 
Prerequisites:
- You have created a [GCP project](https://github.com/gl-bigdata-procamp/bigdata-procamp/blob/master/infra/README.md#create-google-cloud-project)
- You have created a [Dataproc cluster](https://github.com/gl-bigdata-procamp/bigdata-procamp/blob/master/infra/README.md#create-dataproc-cluster)
- Your Dataproc cluster is up and running
 
 How to
1. Start GCP console (if you don't have GCP CLI on your host machine)
2. Connect to your Dataproc cluster master node 

  > `gcloud compute ssh procamp-cluster-m --zone=us-east1-b --project=[YOUR PROJECT ID]`


**Note**: It is supposed your Dataproc cluster name is `procamp-cluster` and zone `us-east1-b`


3. Clone this repository 

> git clone https://github.com/gl-bigdata-procamp/bigdata-procamp.git

4. Navigate to Hadoop MapReduce labs

> cd bigdata-procam/labs/hadoop-mr

5. There are 4 demo projects:
- failing
- stuck
- word_counter
- word_counter_python

6. Check out their readme to find out the way to run the examples
7. Check out their `source` folders to find out their implementation details
8. Java based application use Maven package manage. In order to reasseble an application jar 
> - go to an example source dir 
>- execute `mvn clean package`
>- find output artifact under `target` in an example `source` dir 