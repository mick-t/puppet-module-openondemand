require 'spec_helper'

describe 'openondemand::cluster' do
  on_supported_os.each do |os, facts|
    context "on #{os}" do
      let(:facts) do
        facts
      end

      let :title do
        'test'
      end

      let :params do
        {
          acls: [
            {
              'adapter' => 'group',
              'groups' => ['test-group'],
              'type' => 'whitelist',
            },
          ],
          rsv_query_acls: [
            {
              'adapter' => 'group',
              'groups' => ['test-group-rsv'],
              'type' => 'blacklist',
            },
          ],
          login_host: 'login.test',
          job_adapter: 'torque',
          job_host: 'batch.test',
          job_lib: '/opt/torque/lib64',
          job_bin: '/opt/torque/bin',
          job_version: '6.0.2',
          scheduler_type: 'moab',
          scheduler_host: 'batch.test',
          scheduler_bin: '/opt/moab/bin',
          scheduler_version: '9.0.1',
          scheduler_params: {
            'moabhomedir' => '/var/spool/moab',
          },
          ganglia_host: 'ganglia.test',
        }
      end

      it do
        is_expected.to contain_file('/etc/ood/config/clusters.d/test.yml').with('ensure' => 'file',
                                                                                'owner'   => 'root',
                                                                                'group'   => 'root',
                                                                                'mode'    => '0644')
      end

      it do
        content = catalogue.resource('file', '/etc/ood/config/clusters.d/test.yml').send(:parameters)[:content]
        puts content
      end
    end
  end
end
