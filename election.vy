# Plataforma de election v1.0.0
struct Voter:
    voted: bool
    candidate: uint256
    
struct Candidate:
    votes: uint256
    code: uint256
    

# owner: public(address)
end: public(bool)
users: HashMap[address, Voter]
candidates: public(HashMap[uint256, Candidate])
voteCount: public(uint256)
timeStart: public(uint256)
timeEnd: public(uint256)
winner: public(Candidate)
codes: public(uint256[3])

@external
def __init__(duration: uint256, codes: uint256[3]):
    # self.owner = msg.sender
    self.end = False
    self.timeStart = block.timestamp
    self.timeEnd = self.timeStart + 60*duration # Considerando o tempo em minutos
    self.voteCount = 0
    self.codes = codes
    self.winner = Candidate({
            votes: 0,
            code: 0
        })
    for i in range(3):
        self.candidates[codes[i]] = Candidate({
            votes: 0,
            code: codes[i]
        })
    

@external
def vote(code: uint256):
    assert not self.users[msg.sender].voted
    assert self.end == False, "Error: election is finished"
    assert block.timestamp < self.timeEnd, "Error: election time is finished"
    self.candidates[code].votes += 1
    self.voteCount += 1
    self.users[msg.sender].voted = True
    self.users[msg.sender].candidate = code

@external
def finish():
    assert block.timestamp > self.timeEnd, "Error: wait for the end time"
    self.end = True
    for i in range(3):
        if self.candidates[self.codes[i]].votes > self.winner.votes:
            self.winner = self.candidates[self.codes[i]]


        