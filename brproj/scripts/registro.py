import json, os
from brownie import accounts
import io
from contextlib import redirect_stdout

def read_accounts(filename):
    try:
        with open(filename, "r") as f:
            return f.read().split('\n')
    except FileNotFoundError:
        raise Exception(f"No accounts found in {filename}")

def read_inscritos(filename):
    try:
        with open(filename, "r") as reg:
            return json.load(reg)
    except FileNotFoundError:
        print("did not find file. Returning an empty dict")
        return {}


def save_entry(number, public):
    inscritos[str(number)] = 0
    print(inscritos)
    with open("registros.json", "w") as reg:
        json.dump(inscritos, reg)
    with open("contas.log","a") as f:
        f.write(str(public)+"\n")       


inscritos = read_inscritos("registros.json")

def main():
    while True:
        matricula = input("Numero de matricula: ")
        if(matricula == "-1"): break
        if(matricula in inscritos): print("Matricula ja cadastrada."); continue
        
        #Gera a carteira e captura o mnemonico de saída
        f = io.StringIO()
        with redirect_stdout(f):
            #do_something(my_object)
            carteira = accounts.add()
        mnemonic = f.getvalue()

        #Palavras a serem guardadas/enviadas/copiadas para o eleitor
        print(f"Guarde essas palavras: {mnemonic.split(':')[1]}")
        

        print(f"Carteira: {carteira} adicionada.")
        save_entry(matricula,carteira)
