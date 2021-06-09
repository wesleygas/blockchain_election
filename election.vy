# Plataforma de election v1.0.0

owner: public(address)
end: public(bool)
voters: HashMap[address, bool]
votersCount: public(uint256)
candidates: HashMap[uint256, uint256]
candidatesPartial: public(HashMap[uint256, uint256])
candidatesCount: public(uint256)
voteCount: public(uint256)
timeStart: public(uint256)
timeEnd: public(uint256)
winner: public(int128)
winnerVotes: public(uint256)
draw: bool

candidatesCounted: uint256

@external
def __init__(n: uint256):
    self.owner = msg.sender
    self.candidatesCount = n
    self.winner = -1

@external      
def initElection(duration: uint256):
    assert msg.sender == self.owner
    self.timeStart = block.timestamp
    self.timeEnd = self.timeStart + 60*duration # Considerando o tempo em minutos
    self.end = False
    

    
@external
def giveRightToVote(voter: address):
    assert self.timeStart == 0, "Erro: eleição já iniciada"
    assert msg.sender == self.owner, "Erro: somente o dono pode dar direito ao voto"
    assert not self.voters[voter], "Erro: eleitor já tem direito a voto"
    self.voters[voter] = True
    self.votersCount += 1



@external
def vote(code: uint256) -> uint256:
    assert self.voters[msg.sender]
    assert block.timestamp < self.timeEnd, "Error: election time is finished"
    assert self.end == False, "Error: election is finished"
    self.candidates[code] += 1
    self.voteCount += 1
    self.voters[msg.sender] = False
    return code

@external
def finish():
    assert block.timestamp > self.timeEnd, "Error: wait for the end time"
    self.end = True

@external
def getWinner():
    assert self.end == True
    for idx in range(self.candidatesCounted, self.candidatesCounted + 5):
        if idx > self.candidatesCount:
            return
        if self.candidates[idx] > self.winnerVotes:
            self.winner = convert(idx, int128)
            self.winnerVotes = self.candidates[idx]
            self.draw = False
        elif self.candidates[idx] == self.winnerVotes:
            self.draw = True
            self.winner = -2
        self.candidatesPartial[idx] = self.candidates[idx]
    self.candidatesCounted += 5