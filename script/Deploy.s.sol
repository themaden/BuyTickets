// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {BuyTickets} from "../src/BuyTickets.sol";

contract Deploy is Script {
    function run() public {
        vm.startBroadcast();

        // Deploy the contract
        BuyTickets ticketContract = new BuyTickets();

        // Log the contract address
        console.log("Ticket Contract deployed to:", address(ticketContract));

        vm.stopBroadcast();
    }
}
