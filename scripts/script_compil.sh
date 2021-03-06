#!/bin/sh

# Permet d'avoir icpc dans son environnement
#source /opt/intel/parallel_studio_xe_2018/psxevars.sh intel64

#COMPILATION

echo "debut compilation"

mkdir -p ../bin

# NON PARALLELISEE
echo "compilation partie non parallelisee"
g++ ../sources/minimax_graph.cpp -std=c++11 -o ../bin/gcc_no_option.out
g++ ../sources/minimax_graph.cpp -std=c++11 -O1 -o ../bin/gcc_O1.out
g++ ../sources/minimax_graph.cpp -std=c++11 -O2 -o ../bin/gcc_O2.out
g++ ../sources/minimax_graph.cpp -std=c++11 -O3 -o ../bin/gcc_O3.out
g++ ../sources/minimax_graph.cpp -std=c++11 -Os -o ../bin/gcc_Osize.out

icpc ../sources/minimax_graph.cpp -std=c++11 -O0 -o ../bin/intel_no_option.out
icpc ../sources/minimax_graph.cpp -std=c++11 -O1 -o ../bin/intel_O1.out
icpc ../sources/minimax_graph.cpp -std=c++11 -O2 -o ../bin/intel_O2.out
icpc ../sources/minimax_graph.cpp -std=c++11 -O3 -o ../bin/intel_O3.out
icpc ../sources/minimax_graph.cpp -std=c++11 -Os -o ../bin/intel_Osize.out

clang++ ../sources/minimax_graph.cpp -std=c++11 -O0 -o ../bin/clang_no_option.out
clang++ ../sources/minimax_graph.cpp -std=c++11 -O1 -o ../bin/clang_O1.out
clang++ ../sources/minimax_graph.cpp -std=c++11 -O2 -o ../bin/clang_O2.out
clang++ ../sources/minimax_graph.cpp -std=c++11 -O3 -o ../bin/clang_O3.out
clang++ ../sources/minimax_graph.cpp -std=c++11 -Os -o ../bin/clang_Osize.out

# PARALLELISEE
echo "compilation partie parallelisee"
g++ ../sources/minimax_graph_parallel_naif.cpp -std=c++11 -O3 -o ../bin/gcc_O3_naif.out -fopenmp

icpc ../sources/minimax_graph_parallel_naif.cpp -std=c++11 -O3 -o ../bin/intel_O3_naif.out -fopenmp

clang++ ../sources/minimax_graph_parallel_naif.cpp -std=c++11 -O3 -o ../bin/clang_O3_naif.out -fopenmp

echo "compilation vtune partie parallelisee"
icpc ../sources/minimax_graph_parallel_naif.cpp -std=c++11 -g -debug inline-debug-info -parallel-source-info=2 -shared-intel -O3 -o ../bin/intel_O3_naif_vtune.out -fopenmp

echo "compilation hashmap"

g++ ../sources/minimax_map.cpp -std=c++11 -O3 -o ../bin/gcc_map.out

icpc ../sources/minimax_map.cpp -std=c++11 -O3 -o ../bin/intel_map.out

clang++ ../sources/minimax_map.cpp -std=c++11 -O3 -o ../bin/clang_map.out


g++ ../sources/minimax_unordered_map.cpp -std=c++11 -O3 -o ../bin/gcc_unordered_map.out

icpc ../sources/minimax_unordered_map.cpp -std=c++11 -O3 -o ../bin/intel_unordered_map.out

clang++ ../sources/minimax_unordered_map.cpp -std=c++11 -O3 -o ../bin/clang_unordered_map.out

echo "compilation trie coups"

g++ ../sources/minimax_graph_trie.cpp -std=c++11 -O3 -o ../bin/gcc_trie.out

icpc ../sources/minimax_graph_trie.cpp -std=c++11 -O3 -o ../bin/intel_trie.out

clang++ ../sources/minimax_graph_trie.cpp -std=c++11 -O3 -o ../bin/clang_trie.out


echo "compilation parallele padding"

g++ ../sources/minimax_graph_parallel_naif_padding.cpp -std=c++11 -O3 -o ../bin/gcc_O3_padding.out -fopenmp

icpc ../sources/minimax_graph_parallel_naif_padding.cpp -std=c++11 -O3 -o ../bin/intel_O3_padding.out -fopenmp

clang++ ../sources/minimax_graph_parallel_naif_padding.cpp -std=c++11 -O3 -o ../bin/clang_O3_padding.out -fopenmp

echo "compilation nouvelle version parallele"

g++ ../sources/minimax_jouecoup_parallel.cpp -std=c++11 -O3 -o ../bin/gcc_O3_parallel.out -fopenmp

icpc ../sources/minimax_jouecoup_parallel.cpp -std=c++11 -O3 -o ../bin/intel_O3_parallel.out -fopenmp

clang++ ../sources/minimax_jouecoup_parallel.cpp -std=c++11 -O3 -o ../bin/clang_O3_parallel.out -fopenmp

echo "taille int"

g++ ../sources/int_size.cpp -std=c++11 -O3 -o ../bin/gcc_taille_int.out

icpc ../sources/int_size.cpp -std=c++11 -O3 -o ../bin/intel_taille_int.out

clang++ ../sources/int_size.cpp -std=c++11 -O3 -o ../bin/clang_taille_int.out


echo "compilation partie parallelisee v2"
g++ ../sources/minimax_graph_parallel_v2.cpp -std=c++11 -O3 -o ../bin/gcc_O3_v2.out -fopenmp

icpc ../sources/minimax_graph_parallel_v2.cpp -std=c++11 -O3 -o ../bin/intel_O3_v2.out -fopenmp

echo "natif"

icpc ../sources/minimax_graph_parallel_v2.cpp -std=c++11 -O3 -o ../bin/intel_O3_v2_natif.out -fopenmp -xHost -no-prec-div -Zp4 -align -ansi-alias -ipo

echo "fin de compilation"
