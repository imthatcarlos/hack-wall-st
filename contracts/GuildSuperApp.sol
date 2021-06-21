pragma solidity ^0.6.11;

import "@superfluid-finance/ethereum-contracts/contracts/interfaces/superfluid/ISuperfluid.sol";
import "@superfluid-finance/ethereum-contracts/contracts/interfaces/agreements/IConstantFlowAgreementV1.sol";
import "@superfluid-finance/ethereum-contracts/contracts/apps/SuperAppBase.sol";

contract Pool is SuperAppBase {
  ISuperfluid private _host; // host
  IConstantFlowAgreementV1 private _cfa; // the stored constant flow agreement class address
  ISuperToken private _acceptedToken; // accepted token

  constructor(
    ISuperfluid host,
    IConstantFlowAgreementV1 cfa,
    ISuperToken acceptedToken
  ) {
    assert(address(host) != address(0));
    assert(address(cfa) != address(0));
    assert(address(acceptedToken) != address(0));

    _host = host;
    _cfa = cfa;
    _acceptedToken = acceptedToken;

    uint256 configWord =
      SuperAppDefinitions.APP_LEVEL_FINAL |
      SuperAppDefinitions.BEFORE_AGREEMENT_CREATED_NOOP |
      SuperAppDefinitions.BEFORE_AGREEMENT_UPDATED_NOOP |
      SuperAppDefinitions.BEFORE_AGREEMENT_TERMINATED_NOOP;

    _host.registerApp(configWord);
  }
}
