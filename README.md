# Prepare enviroment
1. Install necessary prequisites
```bash
sudo apt install perl
```
2. Install `libbf.a`
```bash
cd Pythia; git clone https://github.com/mavam/libbf.git libbf
cd libbf
mkdir build && cd build
cmake ../
make clean && make
```
3. Set appropriate environment variables as follows:
```bash
source setvars.sh
```


# Download traces (SPEC06)
We use SPEC CPU 2006 test suite as benchmark which is widely used for CPU performance evaluation.
```bash
mkdir $PYTHIA_HOME/traces/
cd $PYTHIA_HOME/scripts/
perl download_traces.pl --csv spec06_traces.csv --dir ../traces/
```


# Build simulator(ChampSim)
Use `build_all.sh` to build all the bin file used for the experiment.
```bash
./build_all.sh
```


# Launching Experiments

## 1-Core experiments
```bash
cd $PYTHIA_HOME/experiments/
perl ../scripts/create_jobfile.pl --exe $PYTHIA_HOME/bin/<bin file> --tlist ADV_TECH_4C.tlist --exp MICRO21_1C.exp --local 1 > jobfile.sh

cd experiments_1C
source ../jobfile.sh
```

`<bin file>` is all the binary executable files we build in the previous step, including 3 choices:
- perceptron-multi-multi-no-lru-1core
- perceptron-multi-multi-no-drrip-1core
- perceptron-multi-multi-no-ship-1core

## 4-Core experiments
```bash
cd $PYTHIA_HOME/experiments/
perl ../scripts/create_jobfile.pl --exe $PYTHIA_HOME/bin/<bin file> --tlist ADV_TECH_4C.tlist --exp MICRO21_4C.exp --local 1 > jobfile.sh

cd experiments_4C
source ../jobfile.sh
```

`<bin file>` is all the binary executable files we build in the previous step, including 3 choices:
- perceptron-multi-multi-no-lru-4core
- perceptron-multi-multi-no-drrip-4core
- perceptron-multi-multi-no-ship-4core

## Rolling up reuslts
```bash
cd experiements_1C/
perl ../../scripts/rollup.pl --tlist ../ADV_TECH_1C.tlist --exp ../MICRO21_4C.exp --mfile ../rollup_4C_base_config.mfile > rollup.csv

cd experiements_4C/
perl ../../scripts/rollup.pl --tlist ../ADV_TECH_4C.tlist --exp ../MICRO21_4C.exp --mfile ../rollup_1C_base_config.mfile > rollup.csv
```
