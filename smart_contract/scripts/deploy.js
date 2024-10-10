const main = async () => {
  const instanceOfSmartContract = await hre.ethers.getContractFactory("Transactions");
  const deploySmartContract = await instanceOfSmartContract.deploy();
  await deploySmartContract.deployed();

  console.log("Contract-address: ", deploySmartContract.address);
};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();