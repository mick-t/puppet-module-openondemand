shared_examples 'openondemand::repo' do |facts|
  it do
    is_expected.to contain_yumrepo('ondemand-web').only_with(descr: 'Open OnDemand Web Repo',
                                                             baseurl: "https://yum.osc.edu/ondemand/latest/web/el#{facts[:os]['release']['major']}/$basearch",
                                                             enabled: '1',
                                                             gpgcheck: '1',
                                                             gpgkey: 'https://yum.osc.edu/ondemand/RPM-GPG-KEY-ondemand',
                                                             metadata_expire: '1')
  end

  if facts[:os]['release']['major'].to_i == 7
    if facts[:os]['name'] == 'CentOS'
      it { is_expected.to contain_file('/etc/yum.repos.d/ondemand-centos-scl.repo').with_ensure('absent') }
    else
      it { is_expected.not_to contain_file('/etc/yum.repos.d/ondemand-centos-scl.repo') }
    end

    case facts[:os]['name']
    when 'RedHat'
      it { is_expected.to contain_rh_repo("rhel-server-rhscl-#{facts[:os]['release']['major']}-rpms").with_ensure('present') }
    when 'CentOS'
      it { is_expected.to contain_package('centos-release-scl').with_ensure('installed') }
    end
  end

  context 'when manage_scl => false' do
    let(:params) { { manage_scl: false } }

    it { is_expected.not_to contain_file('/etc/yum.repos.d/ondemand-centos-scl.repo') }
    it { is_expected.not_to contain_rh_repo("rhel-server-rhscl-#{facts[:os]['release']['major']}-rpms") }
    it { is_expected.not_to contain_package('centos-release-scl') }
  end
end
