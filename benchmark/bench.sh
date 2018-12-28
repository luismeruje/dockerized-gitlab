#!/bin/bash
#./bench.sh IP THREADS LOOPS

let size="$2 * $3"

python3 generate_data.py data-$2.csv 1 $size

sudo mkdir -p results

(cd apache-jmeter-5.0/bin; ./jmeter -n -t ../../plans/create_admin.jmx -Jgitlabip=$1)

(cd apache-jmeter-5.0/bin; ./jmeter -n -t ../../plans/register_and_login_plan.jmx -Jthreads=$2 -Jloops=$3 -Jgitlabip=$1 -Jdataset=../../data-$2.csv -Jout=../../results/results_register-and-login_$2.csv)
python3 plot.py results/results_register-and-login_$2.csv results/plot_register-and-login_$2.png > results/txt_register-and-login_$2.txt

sleep 10

(cd apache-jmeter-5.0/bin; ./jmeter -n -t ../../plans/create_repo_plan.jmx -Jthreads=$2 -Jloops=$3 -Jgitlabip=$1 -Jdataset=../../data-$2.csv -Jout=../../results/results_create-repo_$2.csv)
python3 plot.py results/results_create-repo_$2.csv results/plot_create-repo_$2.png > results/txt_create-repo_$2.txt


#NLOOPS=10
#CLIENTS=(10 50 100 200)

#for c in "${CLIENTS[@]}"; do
#    (cd apache-jmeter-5.0/bin; ./jmeter -n -t ../../plans/register_and_login_plan.jmx -Jthreads=$c -Jloops=$NLOOPS -Jgitlabip=$1 -Jdataset=../../data-$c.csv -Jout=../../results/results_register-and-login_$c.csv)
#    sleep 10
#    (cd apache-jmeter-5.0/bin; ./jmeter -n -t ../../plans/create_repo_plan.jmx -Jthreads=$c -Jloops=$NLOOPS -Jgitlabip=$1 -Jdataset=../../data-$c.csv -Jout=../../results/results_create-repo_$c.csv)
#    sleep 10
#    python3 plot.py results/results_register-and-login_$c.csv results/plot_register-and-login_$c.png > results/txt_register-and-login_$c.txt
#    python3 plot.py results/results_create-repo_$c.csv results/plot_create-repo_$c.png > results/txt_create-repo_$c.txt
#done
