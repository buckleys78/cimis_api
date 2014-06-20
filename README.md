# Middleware Rails API to access CIMIS crop growing conditions data.

By [Steve Buckley](steve.buckley@gerrit-tech.com).

[![Code Climate](Code Climate Badge IMG URL goes here)](Code Climate URL goes here)

## Description
**cimis_api** This api provides a JSON endpoint for a client site such as ChartKillers to access groomed data from the California Irrigation Management Information System (CIMIS).


## Usage

The JSON request is expected in the form:
> /stations/station id#/start date as YYYY-MM-DD/end date as YYYY-MM-DD/

The JSON response will be in the form:
> /stations/station id#/calendar data as YYYY-MM-DD/daily min temperature as nn.n/daily max temperature as nn.n/are valid? as boolean/


## Information

Code Fellows 'Advanced Dev Ruby on Rails'


### Known Issues

If you discover any bugs, feel free to create an issue on GitHub fork and
send us a pull request.

[Issues List](Github Issues List URL goes here).

## Authors

* Steve Buckley (github.com/buckley78)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

MIT/X11.
