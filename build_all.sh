#!zsh

# 1-core 
## lru
bash ./build_champsim.sh multi multi no 1 lru
## drrip
bash ./build_champsim.sh multi multi no 1 drrip
## ship
bash ./build_champsim.sh multi multi no 1 ship

# 4-core
## lru
bash ./build_champsim.sh multi multi no 4 lru
## drrip
bash ./build_champsim.sh multi multi no 4 drrip
## ship
bash ./build_champsim.sh multi multi no 4 ship
