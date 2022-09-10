// specify solidity's version use - chapter 2
pragma solidity >=0.5.0 <0.6.0;

// initialize contract - chapter 2
contract ZombieFactory {

    // initializing event - chapter 12
    event NewZombie(uint zombieId, string name, uint dna);

    // initializing variable - chapter 3
    uint dnaDigits = 16; //uint = non-negative value
    
    // mathematical expression - chapter 4 
    uint dnaModulus = 10 ** dnaDigits;

    // initializing struct - chapter 5
    struct Zombie {
        string name;
        uint dna;
    }
    
    // initializing array - chapter 6
    Zombie[] public zombies;

    // initializing public function - chapter 7
    /*
    function createZombie(string memory _name, uint _dna) public {
        zombies.push(Zombie(_name, _dna)); // adding data to struct - chapter 8
    }
    */
    
    // initializing private function - chapter 9
    function _createZombie(string memory _name, uint _dna) private { // change from public to private and adding
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        emit NewZombie(id, _name, _dna); // calling event - chapter 12
    }

    // function with modifiers (view,pure, returns) - chapter 10
    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str))); // hashing & typecasting - chapter 11
        return rand % dnaModulus;
    }
    // initializing public function - chapter 7
    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

}
