from brownie import crowdfund, accounts
import time

#exemplo de deploy de um contrato de nome "crowdfund"
#existente em brproj/contracts

def dep():
    acct = accounts.load('idx0')
    goal = 100
    deadline = 60 #+ int(time.time())
    return crowdfund.deploy(goal, deadline, {'from': acct})

#Com a referencia do deploy eh possivel chamar os métodos
#E cadastrar/distribuir os tokens programaticamente
def test_donate():
    crowd = dep()
    print(dir(crowd))
    print(crowd.donate)


def main():
    test_donate()