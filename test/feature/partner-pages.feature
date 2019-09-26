Feature: Sort name partner
    As an operator,
    I want to search name customer.

    Background:
    # 1: asc tang > giam ; -1: desc giam > tang
    Scenario: 01. Operator itemr per pages
        # Search default, sort by registration date
        When I want to request api ELKSearch partner with data
            | requestData                                                                                                               |
            | {"size":5,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                             |
            | {"total": 7, "list":[{"userId":"565d1af20cf2cc62579cf5bc"},{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"56e683030cf257b1733c9c27"}]} |

        When I want to request api ELKSearch partner with data
            | requestData                                                                                                               |
            | {"size":5,"from":5,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createdDate":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                           |
            | {"total": 7, "list":[{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"5c654c651a9f081dc1f259c0"}]} |
