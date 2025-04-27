// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter counter;

    function setUp() public {
        counter = new Counter();
    }

    function testInitialCountIsZero() public view {
        assertEq(counter.get(), 0);
    }

    function testIncrement() public {
        counter.inc();
        assertEq(counter.get(), 1);
    }

    function testDecrement() public {
        counter.inc();
        counter.dec();
        assertEq(counter.get(), 0);
    }

    function testCannotDecrementBelowZero() public {
        vm.expectRevert(bytes("Counter: cannot decrement below zero"));
        counter.dec();
    }

    function testReset() public {
        counter.inc();
        counter.inc();
        counter.reset();
        assertEq(counter.get(), 0);
    }
}
