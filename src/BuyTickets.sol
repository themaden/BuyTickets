// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BuyTickets {
    // Mapping to keep track of ticket ownership
    mapping(address => uint256) public tickets;

    // Ticket price in Ether (0.1 Ether)
    uint256 public ticketPrice = 0.1 ether;

    // Event to log ticket purchase
    event TicketPurchased(address indexed buyer, uint256 numberOfTickets);

    // Function to buy a ticket
    function buyTicket() external payable {
        require(msg.value >= ticketPrice, "Not enough Ether sent");
        
        // If user pays more, the excess is kept (not refunded)
        tickets[msg.sender] += 1;

        // Emit an event for the purchase
        emit TicketPurchased(msg.sender, 1);
    }

    // Function to get the number of tickets owned by a specific address
    function ticketsOf(address user) external view returns (uint256) {
        return tickets[user];
    }
}
