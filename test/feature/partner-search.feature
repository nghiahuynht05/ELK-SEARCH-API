Feature: Search name partner
    As an operator,
    I want to search name customer.

    Background:
    # 1: asc tang > giam ; -1: desc giam > tang
    Scenario: 01. Operator search partner by name
        # Search default, sort by registration date
        When I want to request api ELKSearch partner with data
            | requestData                                                                                                               |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"","searchBy":"fullNameSort"},"sort":{"createDate":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"56e683030cf257b1733c9c27"},{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"565d1af20cf2cc62579cf5bc"}]} |

        When I want to request api ELKSearch partner with data
            | requestData                                                                                                                 |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"ui","searchBy":"fullNameSort"},"sort":{"createDate":"asc"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"5667f0040cf2eb9c770e11b2"}]} |

        When I want to request api ELKSearch partner with data
            | requestData                                                                                                                  |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"ung","searchBy":"fullNameSort"},"sort":{"createDate":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                           |
            | {"total": 2, "list":[{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"5670efea0cf2eb9c770e230d"}]} |

    Scenario: 02. Operator search partner by name
        # Search default, sort by registration date
        When I want to request api ELKSearch partner with data
            | requestData                                                                                                         |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"2","searchBy":"phone"},"sort":{"createDate":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                 |
            | {"total": 3, "list":[{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"5667f0040cf2eb9c770e11b2"}]} |

        When I want to request api ELKSearch partner with data
            | requestData                                                                                                           |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"+84","searchBy":"phone"},"sort":{"createDate":"asc"}} |

        Then I should get the response data matches with
            | response                                                                                                                                                                                                                                                                                         |
            | {"total": 7, "list":[{"userId":"5c654c651a9f081dc1f259c0"},{"userId":"56e6837c0cf257b1733c9c2b"},{"userId":"56e683030cf257b1733c9c27"},{"userId":"569da1550cf2ab2ab653c8d2"},{"userId":"5670efea0cf2eb9c770e230d"},{"userId":"5667f0040cf2eb9c770e11b2"},{"userId":"565d1af20cf2cc62579cf5bc"}]} |

        When I want to request api ELKSearch partner with data
            | requestData                                                                                                                    |
            | {"size":20,"from":0,"query":{"fleetId":"taxigroup","txtSearch":"+84963451888","searchBy":"phone"},"sort":{"createDate":"asc"}} |

        Then I should get the response data matches with
            | response                                                     |
            | {"total": 1, "list":[{"userId":"56e683030cf257b1733c9c27"}]} |
