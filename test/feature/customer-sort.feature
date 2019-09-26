Feature: Sort customer
    As an operator,
    I want to sort customer.

    Background:

    # 1: asc tang > giam ; -1: desc giam > tang
    Scenario: 01. Operator sort customer by Name
        # sort no input data
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                        |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":54,"list":[{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d41676fed42d70b843e6fb0"},{"userId":"5d397e7ed6977739e1635311"},{"userId":"5d416806ed42d70b843e6fc4"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                         |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":"fullNameSort"},"sort":{"fullNameSort":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                      |
            | {"from":0,"size":10,"total":54,"list":[{"userId": "5d3e6d9b8bfb355abe681833"},{"userId": "5d3e73068bfb355abe6818cf"},{"userId":"5d3ff666bd234f2f49ffb977"},{"userId": "5d356643f6c6af6e91a93aae"},{"userId": "5d36e71d6594566e9d8d512a"},{"userId": "5d3e74b38bfb355abe6818ef"},{"userId": "5d42702a438d95154489ad89"},{"userId": "5d35655e6396d371fde9d6ee"},{"userId": "5d5bb58726b2fa660a29aab2"},{"userId": "5d3a76a4a582734d619ce25f"}]} |

        # Sort customer by name and filter by registered date
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                                        |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":18,"list":[{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d43b7e418697045a1ef566e"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d428c0f10148923f8e4ee3e"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                                         |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"","searchBy":"fullNameSort"},"sort":{"fullNameSort":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":18,"list":[{"userId":"5d42702a438d95154489ad89"},{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d556d8daf516c610be496b5"},{"userId":"5d43b6eb18697045a1ef565d"},{"userId":"5d522f6e2af5be0a85d06a60"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d43ac752c8e783d1fde10f0"},{"userId":"5d53cfa82d2973174f665d46"},{"userId":"5d428c0f10148923f8e4ee3e"},{"userId":"5d6e3b09cd1378324f4a2991"}]} |

        # Sort customer by name, filter by registered date and search by name
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                                             |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"nghia","searchBy":"fullNameSort"},"sort":{"fullNameSort":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                  |
            | {"from":0,"size":10,"total":3,"list":[{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d43ac752c8e783d1fde10f0"},{"userId":"5d522f6e2af5be0a85d06a60"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                                              |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"nghia","searchBy":"fullNameSort"},"sort":{"fullNameSort":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                  |
            | {"from":0,"size":10,"total":3,"list":[{"userId":"5d522f6e2af5be0a85d06a60"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d43ac752c8e783d1fde10f0"}]} |

    Scenario: 02. Operator sort customer by phone number
        # sort no input data
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                     |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"phone":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                      |
            | {"from":0,"size":10,"total":54,"list":[{"userId": "5d42702a438d95154489ad89"},{"userId": "5d428c0f10148923f8e4ee3e"},{"userId":"5d3a6ef2a582734d619ce1a8"},{"userId": "5d3a76a4a582734d619ce25f"},{"userId": "5d36e71d6594566e9d8d512a"},{"userId": "5d397e7ed6977739e1635311"},{"userId": "5d366f9cf808410579149873"},{"userId": "5d301c4827b0686ff2eb1c9f"},{"userId": "5d36b4693b098d431d8936dc"},{"userId": "5d36b951591f65453b3c16fe"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                      |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"phone":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                       |
            | {"from":0,"size":10,"total":54,"list":[{"userId": "5d6385915d618319fc444828"},{"userId": "5d638d061dc30b1de0b4b497"},{"userId": "5d638d521dc30b1de0b4b499"},{"userId": "5d638dbb1dc30b1de0b4b49f"},{"userId": "5d6e3b09cd1378324f4a2991"},{"userId": "5d5fa48aaa62cc1e24a9d1e6"},{"userId": "5d5fa4eaaa62cc1e24a9d1e7"},{"userId": "5d36ece58934dc6fac3041ae"},{"userId": "5d381662cab1ef0f985e5898"},{"userId": "5d380a3f0a230b06c216cc30"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                     |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"phone":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                                      |
            | {"from":0,"size":10,"total":54,"list":[{"userId": "5d42702a438d95154489ad89"},{"userId": "5d428c0f10148923f8e4ee3e"},{"userId":"5d3a6ef2a582734d619ce1a8"},{"userId": "5d3a76a4a582734d619ce25f"},{"userId": "5d36e71d6594566e9d8d512a"},{"userId": "5d397e7ed6977739e1635311"},{"userId": "5d366f9cf808410579149873"},{"userId": "5d301c4827b0686ff2eb1c9f"},{"userId": "5d36b4693b098d431d8936dc"},{"userId": "5d36b951591f65453b3c16fe"}]} |

        # Sort customer by phone and filter by registered date
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                     |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"phone":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":18,"list":[{"userId":"5d42702a438d95154489ad89"},{"userId":"5d428c0f10148923f8e4ee3e"},{"userId":"5d43ac752c8e783d1fde10f0"},{"userId":"5d43b6eb18697045a1ef565d"},{"userId":"5d43b7e418697045a1ef566e"},{"userId":"5d556d8daf516c610be496b5"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d522f6e2af5be0a85d06a60"},{"userId":"5d53cfa82d2973174f665d46"},{"userId":"5d64e605df226f1a382168ad"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                      |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"phone":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":18,"list":[{"userId":"5d6385915d618319fc444828"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d53cfa82d2973174f665d46"}]} |

        # Sort customer by phone, filter by registered date and search by name
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                                      |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"nghia","searchBy":"fullNameSort"},"sort":{"phone":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                    |
            | {"from":0,"size":10,"total":3,"list":[{"userId": "5d43ac752c8e783d1fde10f0"},{"userId": "5d5f523a25eff4133af01b65"},{"userId":"5d522f6e2af5be0a85d06a60"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                                       |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"nghia","searchBy":"fullNameSort"},"sort":{"phone":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                    |
            | {"from":0,"size":10,"total":3,"list":[{"userId": "5d522f6e2af5be0a85d06a60"},{"userId": "5d5f523a25eff4133af01b65"},{"userId":"5d43ac752c8e783d1fde10f0"}]} |

    Scenario: 03. Operator sort customer by email
        # sort not input data
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                     |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"email":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":54,"list":[{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d41676fed42d70b843e6fb0"},{"userId":"5d392995a555a01faf354d5e"},{"userId":"5d397e7ed6977739e1635311"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                      |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"email":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":54,"list":[{"userId":"5d301c4827b0686ff2eb1c9f"},{"userId":"5d380a3f0a230b06c216cc30"},{"userId":"5d356643f6c6af6e91a93aae"},{"userId":"5d42702a438d95154489ad89"},{"userId":"5d36e71d6594566e9d8d512a"},{"userId":"5d36ece58934dc6fac3041ae"},{"userId":"5d35655e6396d371fde9d6ee"},{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d366f9cf808410579149873"},{"userId":"5d3e9b288bfb355abe681adf"}]} |

        # Sort customer by email and filter by registered date
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                     |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"email":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":18,"list":[{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d43ac752c8e783d1fde10f0"},{"userId":"5d43b6eb18697045a1ef565d"},{"userId":"5d43b7e418697045a1ef566e"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                      |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"email":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":18,"list":[{"userId":"5d42702a438d95154489ad89"},{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d522f6e2af5be0a85d06a60"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d53cfa82d2973174f665d46"},{"userId":"5d428c0f10148923f8e4ee3e"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d556d8daf516c610be496b5"},{"userId":"5d43b7e418697045a1ef566e"},{"userId":"5d43b6eb18697045a1ef565d"}]} |

    Scenario: 04. Operator sort customer by vip
        # sort no input data
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                    |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"rank":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":54,"list":[{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d5bb58726b2fa660a29aab2"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                     |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"rank":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":54,"list":[{"userId":"5d356643f6c6af6e91a93aae"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"}]} |

        # Sort by rank and filter by registered date
        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                    |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-06-30T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"rank":"asc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":54,"list":[{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d5bb58726b2fa660a29aab2"}]} |

        When I want to request api ELKSearch customer with data
            | requestData                                                                                                                                                                     |
            | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-06-30T17:00:00.000Z","endDate":"2019-09-24T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"rank":"desc"}} |

        Then The return data should be matched correctly order with
            | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
            | {"from":0,"size":10,"total":54,"list":[{"userId":"5d356643f6c6af6e91a93aae"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"}]} |

    # Scenario: 05. Operator sort customer by Registered From
    #     # sort no input data
    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                            |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"registerFrom":"asc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":54,"list":[{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d556d8daf516c610be496b5"},{"userId":"5d53cfa82d2973174f665d46"},{"userId":"5d43b7e418697045a1ef566e"},{"userId":"5d43b6eb18697045a1ef565d"},{"userId":"5d43ac752c8e783d1fde10f0"},{"userId":"5d428c0f10148923f8e4ee3e"},{"userId":"5d42702a438d95154489ad89"},{"userId":"5d416806ed42d70b843e6fc4"}]} |

    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                             |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"registerFrom":"desc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":54,"list":[{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d522f6e2af5be0a85d06a60"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d36ece58934dc6fac3041ae"}]} |

    #     # Sort by registerFrom and filter by registered date
    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                                                            |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-25T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"registerFrom":"asc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":18,"list":[{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d556d8daf516c610be496b5"},{"userId":"5d53cfa82d2973174f665d46"},{"userId":"5d43b7e418697045a1ef566e"},{"userId":"5d43b6eb18697045a1ef565d"},{"userId":"5d43ac752c8e783d1fde10f0"},{"userId":"5d428c0f10148923f8e4ee3e"},{"userId":"5d42702a438d95154489ad89"},{"userId":"5d6e3b09cd1378324f4a2991"}]} |

    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                                                             |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-25T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"registerFrom":"desc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":18,"list":[{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d522f6e2af5be0a85d06a60"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d64e605df226f1a382168ad"}]} |

    # Scenario: 06. Operator sort customer by Registered Date
    #     # sort no input data
    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                           |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"createdDate":"asc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                                      |
    #         | {"from":0,"size":10,"total":54,"list":[{"userId": "5d301c4827b0686ff2eb1c9f"},{"userId": "5d3187cd5f1f940d575a7849"},{"userId":"5d35655e6396d371fde9d6ee"},{"userId": "5d356f756396d371fde9d7fa"},{"userId": "5d366f9cf808410579149873"},{"userId": "5d356643f6c6af6e91a93aae"},{"userId": "5d367f53957d9b1d36c7f327"},{"userId": "5d36b4693b098d431d8936dc"},{"userId": "5d36b951591f65453b3c16fe"},{"userId": "5d36c93b2a2d515242d2d747"}]} |

    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                            |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"createdDate":"desc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                                      |
    #         | {"from":0,"size":10,"total":54,"list":[{"userId": "5d6e3b09cd1378324f4a2991"},{"userId": "5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId": "5d638d521dc30b1de0b4b499"},{"userId": "5d638d061dc30b1de0b4b497"},{"userId": "5d6385915d618319fc444828"},{"userId": "5d5fa4eaaa62cc1e24a9d1e7"},{"userId": "5d5fa48aaa62cc1e24a9d1e6"},{"userId": "5d5f523a25eff4133af01b65"},{"userId": "5d5bb58726b2fa660a29aab2"}]} |

    #     # Sort by registered date and filter by registered date
    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                                                           |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-25T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"createdDate":"asc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":18,"list":[{"userId":"5d42702a438d95154489ad89"},{"userId":"5d428c0f10148923f8e4ee3e"},{"userId":"5d43ac752c8e783d1fde10f0"},{"userId":"5d43b6eb18697045a1ef565d"},{"userId":"5d43b7e418697045a1ef566e"},{"userId":"5d522f6e2af5be0a85d06a60"},{"userId":"5d53cfa82d2973174f665d46"},{"userId":"5d556d8daf516c610be496b5"},{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d5f523a25eff4133af01b65"}]} |

    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                                                            |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-25T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"createdDate":"desc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":18,"list":[{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d5bb58726b2fa660a29aab2"}]} |

    # Scenario: 07. Operator sort customer by IOS Last-Login Version
    #     # sort no input data
    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                    |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"lastLogin.iOSVersion":"asc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":54,"list":[{"userId":"5d53cfa82d2973174f665d46"},{"userId":"5d36b4693b098d431d8936dc"},{"userId":"5d416806ed42d70b843e6fc4"},{"userId":"5d4167b4ed42d70b843e6fbd"},{"userId":"5d416778ed42d70b843e6fb6"},{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d428c0f10148923f8e4ee3e"},{"userId":"5d42702a438d95154489ad89"},{"userId":"5d41676fed42d70b843e6fb0"},{"userId":"5d3ff666bd234f2f49ffb977"}]} |

    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                     |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"lastLogin.iOSVersion":"desc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":54,"list":[{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d556d8daf516c610be496b5"}]} |

    #     # Sort by IOS Last-Login Version and filter by registered date
    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                                                                    |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-25T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"lastLogin.iOSVersion":"asc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":18,"list":[{"userId":"5d53cfa82d2973174f665d46"},{"userId":"5d5bb58726b2fa660a29aab2"},{"userId":"5d428c0f10148923f8e4ee3e"},{"userId":"5d42702a438d95154489ad89"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"}]} |

    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                                                                     |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-25T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"lastLogin.iOSVersion":"desc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":18,"list":[{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d556d8daf516c610be496b5"}]} |

    # Scenario: 08. Operator sort customer by Android Last-Login Version
    #     # sort no input data
    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                        |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"lastLogin.androidVersion":"asc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":54,"list":[{"userId":"5d35655e6396d371fde9d6ee"},{"userId":"5d43ac752c8e783d1fde10f0"},{"userId":"5d556d8daf516c610be496b5"},{"userId":"5d3e6efb8bfb355abe681853"},{"userId":"5d3e6d9b8bfb355abe681833"},{"userId":"5d3a76a4a582734d619ce25f"},{"userId":"5d3a6ef2a582734d619ce1a8"},{"userId":"5d397e7ed6977739e1635311"},{"userId":"5d397dc8d6977739e1635300"},{"userId":"5d392995a555a01faf354d5e"}]} |

    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                         |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"lastLogin.androidVersion":"desc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":54,"list":[{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d5bb58726b2fa660a29aab2"}]} |

    #     # Sort by Android Last-Login Version and filter by registered date
    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                                                                        |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-25T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"lastLogin.androidVersion":"asc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":18,"list":[{"userId":"5d43ac752c8e783d1fde10f0"},{"userId":"5d556d8daf516c610be496b5"},{"userId":"5d42702a438d95154489ad89"},{"userId":"5d43b7e418697045a1ef566e"},{"userId":"5d43b6eb18697045a1ef565d"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"}]} |

    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                                                                         |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-25T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"lastLogin.androidVersion":"desc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":18,"list":[{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d5bb58726b2fa660a29aab2"}]} |

    # Scenario: 09. Operator sort customer by Status
    #     # sort no input data
    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                        |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"isActive":"asc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":54,"list":[{"userId":"5d53cfa82d2973174f665d46"},{"userId":"5d3e9b288bfb355abe681adf"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"}]} |

    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                         |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"","endDate":"","txtSearch":"","searchBy":""},"sort":{"isActive":"desc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":54,"list":[{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d5bb58726b2fa660a29aab2"}]} |

    #     # Sort by Status and filter by registered date
    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                                                        |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-25T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"isActive":"asc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":18,"list":[{"userId":"5d53cfa82d2973174f665d46"},{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"}]} |

    #     When I want to request api ELKSearch customer with data
    #         | requestData                                                                                                                                                                         |
    #         | {"size":10,"from":0,"query":{"fleetId":"yumi","startDate":"2019-07-31T17:00:00.000Z","endDate":"2019-09-25T17:00:00.000Z","txtSearch":"","searchBy":""},"sort":{"isActive":"desc"}} |

    #     Then The return data should be matched correctly order with
    #         | response                                                                                                                                                                                                                                                                                                                                                                                                                             |
    #         | {"from":0,"size":10,"total":18,"list":[{"userId":"5d6e3b09cd1378324f4a2991"},{"userId":"5d64e605df226f1a382168ad"},{"userId":"5d638dbb1dc30b1de0b4b49f"},{"userId":"5d638d521dc30b1de0b4b499"},{"userId":"5d638d061dc30b1de0b4b497"},{"userId":"5d6385915d618319fc444828"},{"userId":"5d5fa4eaaa62cc1e24a9d1e7"},{"userId":"5d5fa48aaa62cc1e24a9d1e6"},{"userId":"5d5f523a25eff4133af01b65"},{"userId":"5d5bb58726b2fa660a29aab2"}]} |

