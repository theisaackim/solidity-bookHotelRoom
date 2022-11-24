var HotelRoom = artifacts.require("HotelRoom");

module.exports = function(deployer) {
  // deployment steps
  deployer.deploy(HotelRoom);
};