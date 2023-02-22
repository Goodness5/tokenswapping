import { BigNumber } from "ethers";
import { ethers } from "hardhat";

async function main() {
    const DAIHolder = "0x748dE14197922c4Ae258c7939C7739f3ff1db573";
    const DAI = "0x6B175474E89094C44Da98b954EedeAC495271d0F";
    const BAT = "0x0D8775F648430679A709E98d2b0Cb6250d2887EF";
    const helpers = require("@nomicfoundation/hardhat-network-helpers");
    await helpers.impersonateAccount(DAIHolder);
    const impersonatedSigner = await ethers.getSigner(DAIHolder);
    // const ethereum = "0xC4334A9AF50C80A12C484de643149f6159Bdd110";
    const batholder = "0xE1B71D7fac2701Deec3046796F94045c5aBCfb0b";
    await helpers.impersonateAccount(batholder);
    await helpers.setBalance(batholder,100000000000000000000000000);
    const impersonatedSignerbat = await ethers.getSigner(batholder);

    const [owner] = await ethers.getSigners();
    const Swapper = await ethers.getContractFactory("swapper");
    const swapper = await Swapper.deploy();
    await swapper.deployed();

    console.log(`swapping contract deployed at: ${swapper.address}`);

    const daiContract = await ethers.getContractAt("IERC20", DAI);
    const batContract = await ethers.getContractAt("IERC20", BAT);
    const getDai = await daiContract.connect(impersonatedSigner).transfer(swapper.address, 100);
    console.log(getDai);

    const daibal = await daiContract.balanceOf(swapper.address);
    console.log(`dai balance is ${daibal}`);

    // 2986792780383681984;
    // 2865497368733305680
    // 827346994329617411
    // 827346994329617411;
    const approve = await batContract.connect(impersonatedSignerbat).approve(swapper.address, 100);
    const amt = await ethers.utils.parseEther("0.0000001");

    const swap = await swapper.connect(impersonatedSignerbat).swapBatToDai(1);
    console.log(swap)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
