#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MDP_FILE="$SCRIPT_DIR/data/input/md-charmm.mdp"

echo "===================================="
echo "   GROMACS - Tempo de Simulacao"
echo "===================================="
echo
read -p "Quantos ns deseja simular? " NS

if ! [[ "$NS" =~ ^[0-9]+$ ]]; then
    echo "Erro: informe um numero inteiro de ns."
    exit 1
fi

NSTEPS=$((NS * 500000))

sed -i -E \
    "s|^nsteps[[:space:]]*=.*|nsteps                  = $NSTEPS     ;  $NS ns|" \
    "$MDP_FILE"

echo
echo "Configuracao atualizada:"
echo "Tempo:   $NS ns"
echo "nsteps:  $NSTEPS"
echo "Arquivo: $MDP_FILE"
