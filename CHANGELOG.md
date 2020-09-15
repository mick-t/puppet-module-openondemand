# Change log

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/) and this project adheres to [Semantic Versioning](http://semver.org).

## [v1.1.0](https://github.com/osc/puppet-module-openondemand/tree/v1.1.0) (2020-09-15)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v1.0.0...v1.1.0)

### Added

- Support Linux Host Adapter [\#38](https://github.com/OSC/puppet-module-openondemand/pull/38) ([treydock](https://github.com/treydock))

## [v1.0.0](https://github.com/osc/puppet-module-openondemand/tree/v1.0.0) (2020-08-24)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.14.0...v1.0.0)

### Changed

- BREAKING: READ COMMENTS - Major changes to support OnDemand 1.8 [\#35](https://github.com/OSC/puppet-module-openondemand/pull/35) ([treydock](https://github.com/treydock))

## [v0.14.0](https://github.com/osc/puppet-module-openondemand/tree/v0.14.0) (2020-08-03)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.13.0...v0.14.0)

### Added

- Make nginx\_clean cron schedule configurable [\#37](https://github.com/OSC/puppet-module-openondemand/pull/37) ([danifr](https://github.com/danifr))

## [v0.13.0](https://github.com/osc/puppet-module-openondemand/tree/v0.13.0) (2020-07-29)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.12.0...v0.13.0)

### UNCATEGORIZED PRS; GO LABEL THEM

- Add the ability to load announcements from the config\_repo [\#36](https://github.com/OSC/puppet-module-openondemand/pull/36) ([mattmix](https://github.com/mattmix))

## [v0.12.0](https://github.com/osc/puppet-module-openondemand/tree/v0.12.0) (2020-06-04)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.11.0...v0.12.0)

### Changed

- BREAKING: Switch to using puppet-rhsm for RHEL SCL repo management [\#33](https://github.com/OSC/puppet-module-openondemand/pull/33) ([treydock](https://github.com/treydock))

## [v0.11.0](https://github.com/osc/puppet-module-openondemand/tree/v0.11.0) (2020-06-03)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.10.0...v0.11.0)

### Added

- Add manage\_logrotate parameter [\#32](https://github.com/OSC/puppet-module-openondemand/pull/32) ([treydock](https://github.com/treydock))

## [v0.10.0](https://github.com/osc/puppet-module-openondemand/tree/v0.10.0) (2020-06-02)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.9.3...v0.10.0)

### Added

- Add support for mod\_auth\_cas [\#31](https://github.com/OSC/puppet-module-openondemand/pull/31) ([ghjs](https://github.com/ghjs))

## [v0.9.3](https://github.com/osc/puppet-module-openondemand/tree/v0.9.3) (2020-05-18)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.9.2...v0.9.3)

### Fixed

- Fix OIDC URLs when SSL not configured [\#29](https://github.com/OSC/puppet-module-openondemand/pull/29) ([danifr](https://github.com/danifr))

## [v0.9.2](https://github.com/osc/puppet-module-openondemand/tree/v0.9.2) (2020-05-12)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.9.1...v0.9.2)

### Fixed

- Make sure osmajor does not contain minor release version [\#27](https://github.com/OSC/puppet-module-openondemand/pull/27) ([danifr](https://github.com/danifr))

## [v0.9.1](https://github.com/osc/puppet-module-openondemand/tree/v0.9.1) (2020-04-17)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.9.0...v0.9.1)

### Fixed

- Fix typo when generating grafana configs [\#25](https://github.com/OSC/puppet-module-openondemand/pull/25) ([treydock](https://github.com/treydock))

## [v0.9.0](https://github.com/osc/puppet-module-openondemand/tree/v0.9.0) (2020-03-04)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.8.0...v0.9.0)

### Added

- Support changing maintenance mode HTML [\#24](https://github.com/OSC/puppet-module-openondemand/pull/24) ([treydock](https://github.com/treydock))

## [v0.8.0](https://github.com/osc/puppet-module-openondemand/tree/v0.8.0) (2020-03-03)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.7.0...v0.8.0)

### Added

- Remove ood-portal.conf unit dropin file [\#23](https://github.com/OSC/puppet-module-openondemand/pull/23) ([treydock](https://github.com/treydock))

## [v0.7.0](https://github.com/osc/puppet-module-openondemand/tree/v0.7.0) (2020-03-03)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.6.0...v0.7.0)

### Added

- Add maintenance task [\#22](https://github.com/OSC/puppet-module-openondemand/pull/22) ([treydock](https://github.com/treydock))

## [v0.6.0](https://github.com/osc/puppet-module-openondemand/tree/v0.6.0) (2020-03-02)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.5.0...v0.6.0)

### Added

- Support grafana in cluster configs [\#21](https://github.com/OSC/puppet-module-openondemand/pull/21) ([treydock](https://github.com/treydock))
- Add use\_rewrites, use\_maintenance and maintenance\_ip\_whitelist parameters [\#20](https://github.com/OSC/puppet-module-openondemand/pull/20) ([treydock](https://github.com/treydock))

## [v0.5.0](https://github.com/osc/puppet-module-openondemand/tree/v0.5.0) (2020-02-11)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.4.0...v0.5.0)

### Added

- Better configuration of mod\_auth\_openidc [\#18](https://github.com/OSC/puppet-module-openondemand/pull/18) ([treydock](https://github.com/treydock))

## [v0.4.0](https://github.com/osc/puppet-module-openondemand/tree/v0.4.0) (2020-01-20)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.3.0...v0.4.0)

### Added

- Add oidc\_extra\_configs parameter [\#17](https://github.com/OSC/puppet-module-openondemand/pull/17) ([treydock](https://github.com/treydock))

## [v0.3.0](https://github.com/osc/puppet-module-openondemand/tree/v0.3.0) (2019-11-14)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.2.0...v0.3.0)

### Added

- Add nginx\_stage\_pun\_custom\_env parameter [\#15](https://github.com/OSC/puppet-module-openondemand/pull/15) ([treydock](https://github.com/treydock))

### Fixed

- Fix EL8 support [\#16](https://github.com/OSC/puppet-module-openondemand/pull/16) ([treydock](https://github.com/treydock))

## [v0.2.0](https://github.com/osc/puppet-module-openondemand/tree/v0.2.0) (2019-10-17)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.1.1...v0.2.0)

### Added

- Changes to support 1.7 [\#14](https://github.com/OSC/puppet-module-openondemand/pull/14) ([treydock](https://github.com/treydock))

## [v0.1.1](https://github.com/osc/puppet-module-openondemand/tree/v0.1.1) (2019-09-19)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/v0.1.0...v0.1.1)

### Fixed

- Fix README links [\#13](https://github.com/OSC/puppet-module-openondemand/pull/13) ([treydock](https://github.com/treydock))

## [v0.1.0](https://github.com/osc/puppet-module-openondemand/tree/v0.1.0) (2019-09-19)

[Full Changelog](https://github.com/osc/puppet-module-openondemand/compare/6a14d62901baf820ece3c8c38e29ee3494b30822...v0.1.0)

### Changed

- Make cluster url optional and remove default [\#7](https://github.com/OSC/puppet-module-openondemand/pull/7) ([treydock](https://github.com/treydock))
- Remove use of mod\_php [\#4](https://github.com/OSC/puppet-module-openondemand/pull/4) ([treydock](https://github.com/treydock))
- Refactor ondemand::cluster to better match v2 configs [\#3](https://github.com/OSC/puppet-module-openondemand/pull/3) ([treydock](https://github.com/treydock))
- Major overhaul [\#2](https://github.com/OSC/puppet-module-openondemand/pull/2) ([treydock](https://github.com/treydock))

### Added

- Misc improvements [\#12](https://github.com/OSC/puppet-module-openondemand/pull/12) ([treydock](https://github.com/treydock))
- Add CentOS 7 SCL repo to fix issues with EOL SCLs being removed from CentOS 7.7 [\#11](https://github.com/OSC/puppet-module-openondemand/pull/11) ([treydock](https://github.com/treydock))
- Add README contents [\#10](https://github.com/OSC/puppet-module-openondemand/pull/10) ([treydock](https://github.com/treydock))
- Improvements to simplify module [\#6](https://github.com/OSC/puppet-module-openondemand/pull/6) ([treydock](https://github.com/treydock))
- Improve docs and improve app configs parameters [\#5](https://github.com/OSC/puppet-module-openondemand/pull/5) ([treydock](https://github.com/treydock))
- Convert to PDK module and improvements to pass tests [\#1](https://github.com/OSC/puppet-module-openondemand/pull/1) ([treydock](https://github.com/treydock))

### Fixed

- Only add LDAP Apache modules if auth\_type is 'ldap' [\#9](https://github.com/OSC/puppet-module-openondemand/pull/9) ([treydock](https://github.com/treydock))
- Fix extra newline issue in cluster config [\#8](https://github.com/OSC/puppet-module-openondemand/pull/8) ([treydock](https://github.com/treydock))



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
