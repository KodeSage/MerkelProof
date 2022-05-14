pragma solidity ^0.8.7;

contract MerkelProof {
    function verify (bytes32[] memory proof, bytes32 root, bytes32 leaf, uint index) public pure returns bool{
        bytes32 hash = leaf;

        for (uint i = 0; i < proof.length; i++) {
            if (index % 2 == 0 ) {
                hash = keccak256(abi.encodePacked(hash, proof[i])); // even => (current hash, proof element)
            }
            else {
                 hash = keccak256(abi.encodePacked(proof[i], hash));  // odd => (proof element, current hash)
            }

            index = index / 2;   // updates the index and iterates again
  
        }
        return hash == root;

        
    }
}