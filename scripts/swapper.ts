import { ethers } from "hardhat";

async function main() {
    const DAIHolder = "0x748dE14197922c4Ae258c7939C7739f3ff1db573"
    const DAI = "0x6B175474E89094C44Da98b954EedeAC495271d0F"
    const helpers = require("@nomicfoundation/hardhat-network-helpers");
    await helpers.impersonateAccount(DAIHolder);
    const impersonatedSigner = await ethers.getSigner(DAIHolder);

    const [owner] = await ethers.getSigners();
    const Swapper = await ethers.getContractFactory("swapper");
    const swapper = await Swapper.deploy();
    await swapper.deployed();

    console.log(`swapping contract deployed at: ${swapper.address}`);

    const sendether = await swapper.connect(owner)
    await ethers.send(swapper.address, 0.1);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
