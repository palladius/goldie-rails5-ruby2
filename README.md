# Goldie GCE Regions

This is Riccardo's ex *goldie* 2018 RoR distro (now I have a better 2020 on with ROR6) - 
it has a sample model and some GCE Regions to get you up and running quickly and edit away.
Currently working on dockerization.

# Install

* Rails 5.2.4.3
* Ruby 2.5.3

# Run

    make run        # run normally
    make docker-run # run dockerized version, and builds if necessary.

## DB History

    2020-12-18 rails generate migration addMachineTypesToGceRegion machine_types:string cpus:string resources:string

# Thanks

* DHH
* Matz
