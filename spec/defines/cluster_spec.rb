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

      let :default_params do
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

      let(:params) { default_params }

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

      context 'with grafana defined' do
        let :params do
          default_params.merge!(
            ganglia_host: nil,
            grafana_host: 'https://grafana.domain',
            grafana_dashboard_name: 'test',
            grafana_dashboard_uid: 'foo',
            grafana_dashboard_panels: { 'cpu' => 1, 'memory' => 2 },
            grafana_labels: { 'cluster' => 'cluster', 'host' => 'host' },
          )
        end

        it { is_expected.to compile.with_all_deps }

        context 'with partial params' do
          let :params do
            default_params.merge!(
              ganglia_host: nil,
              grafana_host: 'https://grafana.domain',
            )
          end

          it 'fails with lack of parameters' do
            is_expected.to compile.and_raise_error(%r{Must define grafana})
          end
        end

        context 'require cpu and memory panels' do
          let :params do
            default_params.merge!(
              ganglia_host: nil,
              grafana_host: 'https://grafana.domain',
              grafana_dashboard_name: 'test',
              grafana_dashboard_uid: 'foo',
              grafana_dashboard_panels: { 'cpu' => 1 },
              grafana_labels: { 'cluster' => 'cluster', 'host' => 'host' },
            )
          end

          it 'fails' do
            is_expected.to compile.and_raise_error(%r{expects a value for key 'memory'})
          end
        end
      end
    end
  end
end
