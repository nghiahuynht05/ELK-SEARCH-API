Feature: Items per pages customer
    As an operator,
    I want to Items per pages.

    Background:

    # 1: asc tang > giam ; -1: desc giam > tang
    Scenario: 01. Operator filter customer by itemr per pages
        # Items per pages defaul
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                            |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":54,"list":[{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d41676fed42d70b843e6fb0"},{"userId":"5d397e7ed6977739e1635311"},{"userId":"5d416806ed42d70b843e6fc4"}]} |

        # Items per pages 1
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                             |
            | {"size":10,"from":10,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                              |
            | {"from":10,"size":10,"total":54,"list":[{"userId":"5d416778ed42d70b843e6fb6"},{"userId":"5d36b4693b098d431d8936dc"},{"userId":"5d3187cd5f1f940d575a7849"},{"userId":"5d36b951591f65453b3c16fe"},{"userId":"5d3803c7ba6fcb6cbf07d9d0"},{"userId":"5d4167b4ed42d70b843e6fbd"},{"userId":"5d366f9cf808410579149873"},{"userId":"5d36ece58934dc6fac3041ae"},{"userId":"5d3e9b288bfb355abe681adf"},{"userId":"5d392995a555a01faf354d5e"}]} |

        # Items per pages lats pages
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                             |
            | {"size":10,"from":50,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                          |
            | {"from":50,"size":10,"total":54,"list":[{"userId":"5d3ff666bd234f2f49ffb977"},{"userId":"5d356643f6c6af6e91a93aae"},{"userId":"5d3e73068bfb355abe6818cf"},{"userId":"5d3e6d9b8bfb355abe681833"}]} |

    Scenario: 02. Check response value active status of all customer
        # Items per pages defaul
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                            |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                  |
            | {"summary":{"total":54,"totalActive":52}} |

    Scenario: 03. Check validate data request
        # size is invalidate
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                            |
            | {"size":"","from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then I should get an error object in returned data with errorCode "VALIDATION_ERROR"

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                             |
            | {"size":"a","from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then I should get an error object in returned data with errorCode "VALIDATION_ERROR"

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                           |
            | {"size":1,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then I should get an error object in returned data with errorCode "VALIDATION_ERROR"

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                             |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"a","endDate":"","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then I should get an error object in returned data with errorCode "VALIDATION_ERROR"

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                             |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"a","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then I should get an error object in returned data with errorCode "VALIDATION_ERROR"

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                        |
            | {"size":10,"from":0,"query":{"fleetId":"","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"fullNameSort":"asc"}} |

        Then I should get an error object in returned data with errorCode "ACCESS_DENIED"
