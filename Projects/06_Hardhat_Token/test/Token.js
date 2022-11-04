const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Testing Token Contract", () => {
  // Declare some variale in top scope which can be repeated
  let owner;
  let account1;
  let account2;
  let Token;
  let hardhatToken;

  // Set the value of repeated var
  beforeEach(async () => {
    Token = await ethers.getContractFactory("Token");
    [owner, account1, account2] = await ethers.getSigners();
    hardhatToken = await Token.deploy();
  });

  //   Deployment test
  describe("Deployment Related Testing", () => {
    it("Test if owner is selected successfully or not", async () => {
      const contractOwner = await hardhatToken.owner();
      // expect(owner.address == contractOwner);
      expect(owner.address).to.equal(contractOwner);
    });

    it("In the time of token creation whole token should in the account of owner", async () => {
      expect(
        (await hardhatToken.maxSupply()) ==
          (await hardhatToken.getBalance(owner.address))
      );
    });
  });

  //   Transaction related test
  describe("Transaction Testing", () => {
    it("For insufficent balance should print error", async () => {
      await expect(
        hardhatToken.connect(account1).transfer(owner.address, 10)
      ).to.be.revertedWith("Not enough balance");
      expect(await hardhatToken.getBalance(owner.address)).to.equal(
        await hardhatToken.maxSupply()
      );
    });

    it("Transaction should do properly", async () => {
      // owner -> acc1 10
      await hardhatToken.transfer(account1.address, 10);
      const account1_balance = await hardhatToken.getBalance(account1.address);

      expect(
        (await hardhatToken.getBalance(owner.address)) ==
          (await hardhatToken.maxSupply) - 10
      );
      expect(account1_balance == 10);

      // acc1 -> acc2 5
      await hardhatToken.connect(account1).transfer(account2.address, 5);
      const account2_balance = await hardhatToken.getBalance(account2.address);

      expect(account1_balance === 5 && account2_balance === 5);
    });
  });
});
