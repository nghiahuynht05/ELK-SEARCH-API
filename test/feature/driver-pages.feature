Feature: Items per pages customer
    As an operator,
    I want to Items per pages.

    Background:

    # 1: asc tang > giam ; -1: desc giam > tang
    Scenario: 01. Operator filter customer by itemr per pages
        # Items per pages defaul
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                               |
            | {"size":20,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
            | {"from":0,"size":20,"total": 18, "list":[{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"},{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d3e594646694d6a60b712cd"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d36db57f042ee5f62b35bd3"},{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d3523c5e01cf260ad22cacc"}]} |

        # Items per pages 1
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                               |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":18,"list":[{"userId":"5d8c15959d9d7d4194d8d708"},{"userId":"5d8c15599d9d7d4194d8d706"},{"userId":"5d8c152f9d9d7d4194d8d704"},{"userId":"5d5a780678e8f914451215f7"},{"userId":"5d5a6acfe66ccc0ab3adeceb"},{"userId":"5d5a6ab7e66ccc0ab3adece6"},{"userId":"5d5a57b18ea2287534f94a05"},{"userId":"5d5a578c8ea2287534f94a00"},{"userId":"5d5a567b8ea2287534f949fa"},{"userId":"5d5a54128ea2287534f949f3"}]} |

        # Items per pages lats pages
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                |
            | {"size":10,"from":10,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                  |
            | {"from":10,"size":10,"total":18,"list":[{"userId":"5d41634c49050a52af4b3e8f"},{"userId":"5d40153ebd234f2f49ffba00"},{"userId":"5d3e596046694d6a60b712d2"},{"userId":"5d3e594646694d6a60b712cd"},{"userId":"5d3914266789a11b4c9b5d6b"},{"userId":"5d36db57f042ee5f62b35bd3"},{"userId":"5d358b00f6c6af6e91a93ae2"},{"userId":"5d3523c5e01cf260ad22cacc"}]} |

    Scenario: 02. Check response value active status of all customer
        # Items per pages defaul
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                               |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                 |
            | {"summary":{"total":18,"totalActive":8}} |

    Scenario: 03. Check validate data request
        # size is invalidate
        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                              |
            | {"size":1,"from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then I should get an error object in returned data with errorCode "VALIDATION_ERROR"

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                                |
            | {"size":"a","from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then I should get an error object in returned data with errorCode "VALIDATION_ERROR"

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                               |
            | {"size":"","from":0,"query":{"fleetId":"yumi","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then I should get an error object in returned data with errorCode "VALIDATION_ERROR"

        When I want to request api ELKSearch driver with data
            | requestData                                                                                                                                           |
            | {"size":10,"from":0,"query":{"fleetId":"","companyId": "all","zoneId": "all","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"desc"}} |

        Then I should get an error object in returned data with errorCode "ACCESS_DENIED"
