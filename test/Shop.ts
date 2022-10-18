import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";
import fs from 'fs';

describe("Shop", function () {

  async function deployContractsFixture() {

    const [owner, user] = await ethers.getSigners();
    const price:any = ethers.utils.parseEther('1') ; // https://bobbyhadz.com/blog/typescript-type-has-no-properties-in-common-with-type
    const Shop = await ethers.getContractFactory("Shop");
    const shop = await Shop.deploy(price);
    await shop.deployed();
    return { shop, owner, user, price };
  }

  describe("Deployment", function () {
    it("Should deploy MyWeb3Service.sol", async function () {
      const { shop, owner } = await loadFixture(deployContractsFixture);
      expect(await shop.owner()).to.equal(owner.address);
    });
  });

  describe("Transfers", function () {
    it("Should use the service", async function () {
      const { shop, user } = await loadFixture(deployContractsFixture);
      await shop.connect(user).buy("champagne", {value: ethers.utils.parseEther('1')});
      expect(await shop.champsElysees()).to.equal("champagne");
    });
  });
});
