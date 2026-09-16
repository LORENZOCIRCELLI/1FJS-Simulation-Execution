echo "===================================="
echo "   VENV - Criando e Instalando"
echo "===================================="
echo

python3 -m venv .venv
source ./.venv/bin/activate
pip install -r requirements.txt

echo
echo "Finalizando..."
