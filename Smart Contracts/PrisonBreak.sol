// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// OpenZeppelin Contracts v4.4.1 (utils/Counters.sol)
// File: @openzeppelin/contracts/utils/Counters.sol
pragma solidity ^0.8.0;

/**
 * @title Counters
 * @author Matt Condon (@shrugs)
 * @dev Provides counters that can only be incremented, decremented or reset. This can be used e.g. to track the number
 * of elements in a mapping, issuing ERC721 ids, or counting request ids.
 *
 * Include with `using Counters for Counters.Counter;`
 */
library Counters {
    struct Counter {
        // This variable should never be directly accessed by users of the library: interactions must be restricted to
        // the library's function. As of Solidity v0.5.2, this cannot be enforced, though there is a proposal to add
        // this feature: see https://github.com/ethereum/solidity/issues/4637
        uint256 _value; // default: 0
    }

    function current(Counter storage counter) internal view returns (uint256) {
        return counter._value;
    }

    function increment(Counter storage counter) internal {
    unchecked {
        counter._value += 1;
    }
    }

    function decrement(Counter storage counter) internal {
        uint256 value = counter._value;
        require(value > 0, "Counter: decrement overflow");
    unchecked {
        counter._value = value - 1;
    }
    }

    function reset(Counter storage counter) internal {
        counter._value = 0;
    }
}

// OpenZeppelin Contracts v4.3.2 (utils/introspection/IERC165.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC165 standard, as defined in the
 * https://eips.ethereum.org/EIPS/eip-165[EIP].
 *
 * Implementers can declare support of contract interfaces, which can then be
 * queried by others ({ERC165Checker}).
 *
 * For an implementation, see {ERC165}.
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}


// OpenZeppelin Contracts v4.3.2 (utils/introspection/ERC165.sol)
// File: @openzeppelin/contracts/utils/introspection/ERC165.sol
pragma solidity ^0.8.0;

/**
 * @dev Implementation of the {IERC165} interface.
 *
 * Contracts that want to implement ERC165 should inherit from this contract and override {supportsInterface} to check
 * for the additional interface id that will be supported. For example:
 *
 * ```solidity
 * function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
 *     return interfaceId == type(MyInterface).interfaceId || super.supportsInterface(interfaceId);
 * }
 * ```
 *
 * Alternatively, {ERC165Storage} provides an easier to use but more expensive implementation.
 */
abstract contract ERC165 is IERC165 {
    /**
     * @dev See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId) public view virtual override returns (bool) {
        return interfaceId == type(IERC165).interfaceId;
    }
}


// OpenZeppelin Contracts v4.3.2 (token/ERC721/IERC721.sol)
// File: @openzeppelin/contracts/token/ERC721/IERC721.sol
pragma solidity ^0.8.0;

/**
 * @dev Required interface of an ERC721 compliant contract.
 */
interface IERC721 is IERC165 {
    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance);

    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be have been allowed to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external;

    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator);

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external;

    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
}

contract PrisonBreak {
    using Counters for Counters.Counter;

    address public admin;
    address public addressEntryTicket;
    address public addressCigarettes;
    address public addressKnives;
    address public addressGuns;
    uint256 public currentTreasure;
    uint256 public nextTreasure;
    uint256 public lastTreasureEndTimestamp;
    bool public isBreakoutOngoing;
    uint256 public gameStartTimestamp;
    uint256 public TFuelIncreasePerSecond;
    uint256 public roundDuration;
    Counters.Counter public currentRound;

    uint256 public storedTFuel;
    uint256 public pastTreasures;

    uint16 public pointsFirstPlace;
    uint16 public pointsSecondPlace;
    uint16 public pointsThirdPlace;
    address public firstPlaceAddress;
    address public secondPlaceAddress;
    address public thirdPlaceAddress;

    uint256 public finalBreakoutStartTimestamp;

    mapping(uint8 => Counters.Counter) experiencePoints;

    struct Participant {
        uint8 entryTicketId;
        uint8[] cigaretteTokenIds;
        uint8 knifeTokenId1;
        uint8 knifeTokenId2;
        uint8 gunTokenId;
        uint16 powerPoints;
        bool claimed;
        bool isWinner;
        uint256 amount;
    }

    struct Round {
        address[] participantsAddresses;
        mapping(address => Participant) addressToParticipants;
        uint256 startTimestamp;
        uint256 endTimestamp;
        bool isOngoing;
        uint256 totalAmount;
        address[] winners;
        bool finalRound;
    }
    mapping(uint => Round) idToRound;

    constructor(address _entryTicket, address _cigarettes, address _knives, address _guns, uint256 TFuelPerSecond, uint256 _gameStartTimestamp, uint256 _roundDuration, uint256 _finalBreakoutStartTimestamp) {
        admin = payable(msg.sender);
        addressEntryTicket = _entryTicket;
        addressCigarettes = _cigarettes;
        addressKnives = _knives;
        addressGuns = _guns;
        TFuelIncreasePerSecond = TFuelPerSecond;
        gameStartTimestamp = _gameStartTimestamp;
        lastTreasureEndTimestamp = _gameStartTimestamp;
        roundDuration = _roundDuration;
        finalBreakoutStartTimestamp = _finalBreakoutStartTimestamp;
    }

    modifier onlyAdmin {
        require(msg.sender == admin, "only the admin can perform this action");
        _;
    }

    /**
     * @notice Change the admin address
     * @param admin_ The address of the new admin
     */
    function setAdmin(address admin_) onlyAdmin external {
        admin = admin_;
    }

    function getCurrentTreasure() public view returns (uint256) {
        if(lastTreasureEndTimestamp < block.timestamp && !isBreakoutOngoing) {
            uint256 timeTreasure = (block.timestamp - lastTreasureEndTimestamp) * TFuelIncreasePerSecond;
            uint256 currentTFuelTreasure = (address(this).balance - pastTreasures - storedTFuel - nextTreasure) + timeTreasure;
            return currentTFuelTreasure;
        } else if (isBreakoutOngoing) {
            return idToRound[currentRound.current()].totalAmount;
        } else {
            return 0;
        }

    }

    function calculatePowerPoints(uint16 numberOfCigarettes, uint8 knifeId1, uint8 knifeId2, uint8 gunId) public pure returns(uint16) {
        uint16 pp = 0;
        uint16 c = numberOfCigarettes;
        uint16 k = 0;
        uint16 g = 0;

        if(knifeId1 != 0) k++;
        if(knifeId2 != 0) k++;
        if(gunId != 0) g=1;

        if(g == 1 && k >= 1 && c >= 1) {
            g = 0;
            k--;
            c--;
            pp = 10+k*2+c;
        } else {
            pp = g*5+k*2+c;
        }
        return pp;
    }

    function startBreakout(uint8 ticketId, uint8[] calldata cigaretteIds, uint8 knifeId1, uint8 knifeId2, uint8 gunId) public payable {
        require(gameStartTimestamp<=block.timestamp, "Game has not started");
        require(msg.value == 20*(10**18), "Incorrect breakout fee");
        require(!isBreakoutOngoing, "Breakout already ongoing");
        require((finalBreakoutStartTimestamp-roundDuration)>block.timestamp, "Only final Breakout can be initiated");
        // start Breakout, increment round
        isBreakoutOngoing = true;
        currentRound.increment();
        // transfer NFTs
        IERC721(addressEntryTicket).transferFrom(msg.sender, address(this), ticketId);
        for (uint8 j = 0; j < cigaretteIds.length; j++) {
            IERC721(addressCigarettes).transferFrom(msg.sender, address(this), cigaretteIds[j]);
        }
        if(knifeId1 != 0) IERC721(addressKnives).transferFrom(msg.sender, address(this), knifeId1);
        if(knifeId2 != 0) IERC721(addressKnives).transferFrom(msg.sender, address(this), knifeId2);
        if(gunId != 0) IERC721(addressGuns).transferFrom(msg.sender, address(this), gunId);
        // set up round
        uint256 roundNumber = currentRound.current();
        idToRound[roundNumber].participantsAddresses.push(msg.sender);
        idToRound[roundNumber].startTimestamp = block.timestamp;
        idToRound[roundNumber].endTimestamp = idToRound[roundNumber].startTimestamp + roundDuration;
        idToRound[roundNumber].isOngoing = true;
        // set up participant
        Participant storage user = idToRound[roundNumber].addressToParticipants[msg.sender];
        user.entryTicketId = ticketId;
        user.cigaretteTokenIds = cigaretteIds;
        user.knifeTokenId1 = knifeId1;
        user.knifeTokenId2 = knifeId2;
        user.gunTokenId = gunId;
        user.claimed = false;
        user.powerPoints = calculatePowerPoints(uint16(cigaretteIds.length), knifeId1, knifeId2, gunId);
        nextTreasure = 20*(10**18);
        uint256 timeTreasure = (idToRound[roundNumber].startTimestamp - lastTreasureEndTimestamp) * TFuelIncreasePerSecond;
        storedTFuel -= timeTreasure;
        idToRound[roundNumber].totalAmount = (address(this).balance - pastTreasures - storedTFuel - nextTreasure);
        lastTreasureEndTimestamp = idToRound[roundNumber].startTimestamp;
    }

    function joinBreakout(uint8 ticketId, uint8[] calldata cigaretteIds, uint8 knifeId1, uint8 knifeId2, uint8 gunId) public payable {
        if(block.timestamp > finalBreakoutStartTimestamp) {
            require(!isBreakoutOngoing, "Last Breakout was not finalized");
            require(block.timestamp <= (finalBreakoutStartTimestamp+roundDuration), "Final breakout ended");
            if(!idToRound[currentRound.current()].finalRound) {
                currentRound.increment();
                idToRound[currentRound.current()].finalRound = true;
                idToRound[currentRound.current()].endTimestamp = finalBreakoutStartTimestamp+roundDuration;
                idToRound[currentRound.current()].startTimestamp = finalBreakoutStartTimestamp;
                uint256 timeTreasure = (idToRound[currentRound.current()].startTimestamp - lastTreasureEndTimestamp) * TFuelIncreasePerSecond;
                idToRound[currentRound.current()].totalAmount = (address(this).balance - pastTreasures - storedTFuel) + timeTreasure;
            }

        } else {
            require(isBreakoutOngoing, "Breakout hasn't started");
            require(msg.value == 10*(10**18), "Incorrect breakout fee");
            nextTreasure += msg.value;
        }
        uint256 roundNumber = currentRound.current();
        require(idToRound[roundNumber].addressToParticipants[msg.sender].entryTicketId == 0, "You already joined");
        IERC721(addressEntryTicket).transferFrom(msg.sender, address(this), ticketId);
        for(uint8 j = 0; j < cigaretteIds.length; j++) {
            IERC721(addressCigarettes).transferFrom(msg.sender, address(this), cigaretteIds[j]);
        }
        if(knifeId1 != 0) IERC721(addressKnives).transferFrom(msg.sender, address(this), knifeId1);
        if(knifeId2 != 0) IERC721(addressKnives).transferFrom(msg.sender, address(this), knifeId2);
        if(gunId != 0) IERC721(addressGuns).transferFrom(msg.sender, address(this), gunId);
        idToRound[roundNumber].participantsAddresses.push(msg.sender);
        // set up participant
        Participant storage user = idToRound[roundNumber].addressToParticipants[msg.sender];
        user.entryTicketId = ticketId;
        user.cigaretteTokenIds = cigaretteIds;
        user.knifeTokenId1 = knifeId1;
        user.knifeTokenId2 = knifeId2;
        user.gunTokenId = gunId;
        user.claimed = false;
        user.powerPoints = calculatePowerPoints(uint16(cigaretteIds.length), knifeId1, knifeId2, gunId);
    }

    function finalizeBreakout() public {
        uint256 roundNumber = currentRound.current();
        if(block.timestamp > finalBreakoutStartTimestamp && idToRound[roundNumber].finalRound) {
            require(block.timestamp > (finalBreakoutStartTimestamp+roundDuration), "Final breakout hasn't ended");
            //            uint16 pointsFirstPlace = 0;
            //            uint16 pointsSecondPlace = 0;
            //            uint16 pointsThirdPlace = 0;
            //            address firstPlaceAddresses;
            //            address secondPlaceAddresses;
            //            address thirdPlaceAddresses;
            // get winning Addresses first second and third place (currently wrong)
            for(uint16 i=0;i<idToRound[roundNumber].participantsAddresses.length; i++){
                if(idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints > pointsFirstPlace){
                    pointsThirdPlace = pointsSecondPlace;
                    pointsSecondPlace = pointsFirstPlace;
                    pointsFirstPlace = idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints;
                    thirdPlaceAddress = secondPlaceAddress;
                    secondPlaceAddress = firstPlaceAddress;
                    firstPlaceAddress = idToRound[roundNumber].participantsAddresses[i];
                }
                else if(idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints == pointsFirstPlace){
                    if(experiencePoints[idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].entryTicketId].current() > experiencePoints[idToRound[roundNumber].addressToParticipants[firstPlaceAddress].entryTicketId].current()) {
                        pointsThirdPlace = pointsSecondPlace;
                        pointsSecondPlace = pointsFirstPlace;
                        pointsFirstPlace = idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints;
                        thirdPlaceAddress = secondPlaceAddress;
                        secondPlaceAddress = firstPlaceAddress;
                        firstPlaceAddress = idToRound[roundNumber].participantsAddresses[i];
                    } else {
                        pointsThirdPlace = pointsSecondPlace;
                        pointsSecondPlace = idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints;
                        thirdPlaceAddress = secondPlaceAddress;
                        secondPlaceAddress = idToRound[roundNumber].participantsAddresses[i];
                    }

                } else if(idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints > pointsSecondPlace){
                    pointsThirdPlace = pointsSecondPlace;
                    pointsSecondPlace = idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints;
                    thirdPlaceAddress = secondPlaceAddress;
                    secondPlaceAddress = idToRound[roundNumber].participantsAddresses[i];
                } else if(idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints == pointsSecondPlace){
                    if(experiencePoints[idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].entryTicketId].current() > experiencePoints[idToRound[roundNumber].addressToParticipants[secondPlaceAddress].entryTicketId].current()) {
                        pointsThirdPlace = pointsSecondPlace;
                        pointsSecondPlace = idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints;
                        thirdPlaceAddress = secondPlaceAddress;
                        secondPlaceAddress = idToRound[roundNumber].participantsAddresses[i];
                    } else {
                        pointsThirdPlace = idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints;
                        thirdPlaceAddress = idToRound[roundNumber].participantsAddresses[i];
                    }
                } else if(idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints > pointsThirdPlace){
                    pointsThirdPlace = idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints;

                    thirdPlaceAddress = idToRound[roundNumber].participantsAddresses[i];
                } else if(idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints == pointsThirdPlace){
                    if(experiencePoints[idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].entryTicketId].current() > experiencePoints[idToRound[roundNumber].addressToParticipants[thirdPlaceAddress].entryTicketId].current()) {
                        pointsThirdPlace = idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints;
                        thirdPlaceAddress = idToRound[roundNumber].participantsAddresses[i];
                    }
                }
            }
            idToRound[roundNumber].winners = [firstPlaceAddress];
            idToRound[roundNumber].addressToParticipants[firstPlaceAddress].isWinner = true;
            idToRound[roundNumber].addressToParticipants[firstPlaceAddress].amount = idToRound[roundNumber].totalAmount;
        } else {
            require(isBreakoutOngoing, "currently no breakout ongoing");
            require(idToRound[roundNumber].endTimestamp < block.timestamp, "Breakout has not ended");
            isBreakoutOngoing = false;
            // get winner(s)
            uint16 winningPoints = 0;
            uint256 winnerCounter;
            for(uint16 i=0;i<idToRound[roundNumber].participantsAddresses.length; i++){
                if(idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints > winningPoints){
                    winningPoints = idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints;
//                    winningAddresses[0] = idToRound[roundNumber].participantsAddresses[i];
                    winnerCounter = 1;
                } else if(idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints == winningPoints){
//                    winningAddresses[winnerCounter] = idToRound[roundNumber].participantsAddresses[i];
                    winnerCounter++;
                }
            }
            address[] memory winningAddresses = new address[](winnerCounter);

//            for(uint16 i=0;i<winnerCounter; i++){
//                idToRound[roundNumber].winners.push(winningAddresses[i]);
//                idToRound[roundNumber].addressToParticipants[winningAddresses[i]].isWinner = true;
//                idToRound[roundNumber].addressToParticipants[winningAddresses[i]].amount = idToRound[roundNumber].totalAmount/winnerCounter;
//            }
            // return items of losers
            uint counter = 0;
            for(uint16 i=0;i<idToRound[roundNumber].participantsAddresses.length; i++){
                if(idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].powerPoints == winningPoints){
                    winningAddresses[counter] = idToRound[roundNumber].participantsAddresses[i];
                    idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].isWinner = true;
                    idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].amount = idToRound[roundNumber].totalAmount/winnerCounter;
                    counter++;
                } else {
                    experiencePoints[idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].entryTicketId].increment();
                    idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].participantsAddresses[i]].claimed = returnNFTs(roundNumber, idToRound[roundNumber].participantsAddresses[i]);
                }
            }
            idToRound[roundNumber].winners = winningAddresses;
            idToRound[roundNumber].isOngoing = false;
            nextTreasure = 0;
            storedTFuel -= 50*(10**18);
            pastTreasures += idToRound[roundNumber].totalAmount;
        }
    }

    function returnNFTs(uint roundNumber, address user) internal returns(bool){
        // return entry ticket
        IERC721(addressEntryTicket).transferFrom(address(this), user, idToRound[roundNumber].addressToParticipants[user].entryTicketId);
        if(idToRound[roundNumber].addressToParticipants[user].gunTokenId != 0) IERC721(addressGuns).transferFrom(address(this), user, idToRound[roundNumber].addressToParticipants[user].gunTokenId);
        if(idToRound[roundNumber].addressToParticipants[user].knifeTokenId1 != 0) IERC721(addressKnives).transferFrom(address(this), user, idToRound[roundNumber].addressToParticipants[user].knifeTokenId1);
        if(idToRound[roundNumber].addressToParticipants[user].knifeTokenId2 != 0) IERC721(addressKnives).transferFrom(address(this), user, idToRound[roundNumber].addressToParticipants[user].knifeTokenId2);
        return true;
    }

    function claimWinnings(uint roundNumber) public {
        require(idToRound[roundNumber].addressToParticipants[msg.sender].isWinner, "You are not a winner");
        require(!idToRound[roundNumber].addressToParticipants[msg.sender].claimed, "Winnings have already been claimed");
        idToRound[roundNumber].addressToParticipants[msg.sender].claimed = true;
        pastTreasures -= idToRound[roundNumber].addressToParticipants[msg.sender].amount;
        // return gun
        if(idToRound[roundNumber].addressToParticipants[msg.sender].gunTokenId != 0) IERC721(addressGuns).transferFrom(address(this), msg.sender, idToRound[roundNumber].addressToParticipants[msg.sender].gunTokenId);
        payable(msg.sender).transfer(idToRound[roundNumber].addressToParticipants[msg.sender].amount * 1 wei);
    }

    function checkWinToClaim(uint roundNumber) public view returns(bool, uint256) {
        if(idToRound[roundNumber].addressToParticipants[msg.sender].isWinner) {
            return (idToRound[roundNumber].addressToParticipants[msg.sender].claimed, idToRound[roundNumber].addressToParticipants[msg.sender].amount);
        } else {
            return (false, 0);
        }
    }

    function getIsBreakoutOngoing() public view returns(bool) {
        if(block.timestamp < finalBreakoutStartTimestamp) {
            return isBreakoutOngoing;
        } else if(block.timestamp > finalBreakoutStartTimestamp && block.timestamp < (finalBreakoutStartTimestamp + roundDuration)) {
            return true;
        } else {
            return false;
        }
    }

    function getNumberOfParticipants(uint roundNumber) public view returns(uint) {
        return idToRound[roundNumber].participantsAddresses.length;
    }

    function getParticipants(uint roundNumber) public view returns(address[] memory) {
        return idToRound[roundNumber].participantsAddresses;
    }

    function getParticipant(uint roundNumber, address participant) public view returns(Participant memory) {
        return idToRound[roundNumber].addressToParticipants[participant];
    }

    function getRound(uint roundNumber) public view returns(uint256, uint256, bool, uint256, address[] memory, bool) {
        return (idToRound[roundNumber].startTimestamp,idToRound[roundNumber].endTimestamp,
        idToRound[roundNumber].isOngoing, idToRound[roundNumber].totalAmount, idToRound[roundNumber].winners,
        idToRound[roundNumber].finalRound);
    }

    function getWinners(uint roundNumber) public view returns(address[] memory, uint256) {
        require(!idToRound[roundNumber].isOngoing,"Round was not finalized");
        return (idToRound[roundNumber].winners, idToRound[roundNumber].addressToParticipants[idToRound[roundNumber].winners[0]].amount);
    }

    function setAddressEntryTicket(address _ticketAddress) public onlyAdmin {
        require(block.timestamp < gameStartTimestamp, "can't change address in game");
        addressEntryTicket = _ticketAddress;
    }

    function setAddressCigarettes(address _cigarettesAddress) public onlyAdmin {
        require(block.timestamp < gameStartTimestamp , "can't change address in game");
        addressCigarettes = _cigarettesAddress;
    }

    function setAddressKnives(address _knivesAddress) public onlyAdmin {
        require(block.timestamp < gameStartTimestamp , "can't change address in game");
        addressKnives = _knivesAddress;
    }

    function setAddressGuns(address _gunsAddress) public onlyAdmin {
        require(block.timestamp < gameStartTimestamp , "can't change address in game");
        addressGuns = _gunsAddress;
    }

    function setTFuelPerSecond(uint256 _TFuelPerSecond) public onlyAdmin {
        TFuelIncreasePerSecond = _TFuelPerSecond;
    }

    function setRoundDuration(uint256 _roundDuration) public onlyAdmin {
        roundDuration = _roundDuration;
    }

    function retrieveCigarettes(uint256[] calldata tokenIds, address to) external onlyAdmin {
        for (uint8 j = 0; j < tokenIds.length; j++) {
            IERC721(addressCigarettes).transferFrom(address(this), to, tokenIds[j]);
        }
    }

    function addTFuel() external payable returns(bool) {
        storedTFuel += msg.value;
        return true;
    }

    function withdrawTFuel(address _to, uint256 _amount) onlyAdmin external {
        require(_amount <= address(this).balance, "You can not withdraw more money than there is");
        payable(_to).transfer(_amount);
    }

    function withdrawTNT721(address _tokenAddr, address _to, uint256 _id) onlyAdmin external {
        IERC721(_tokenAddr).transferFrom(address(this), _to, _id);
    }

    receive() external payable {}
}
