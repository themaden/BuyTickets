// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/BuyTickets.sol";

contract BuyTicketsTest is Test {
    BuyTickets ticketContract;

    function setUp() public {
        ticketContract = new BuyTickets();
    }

    function testBuyTicket() public {
        address user = address(0x123);
        vm.deal(user, 0.2 ether); // Test adresinin bakiyesini 0.2 ether yapıyoruz

        vm.prank(user);
        ticketContract.buyTicket{value: 0.2 ether}();

        uint256 ticketsOwned = ticketContract.ticketsOf(user);
        assertEq(ticketsOwned, 1);
    }

    function testExcessPayment() public {
        address user = address(0x123);
        vm.deal(user, 0.3 ether); // Test adresinin bakiyesini 0.3 ether yapıyoruz

        vm.prank(user);
        ticketContract.buyTicket{value: 0.3 ether}();

        uint256 ticketsOwned = ticketContract.ticketsOf(user);
        assertEq(ticketsOwned, 1);
    }
}
