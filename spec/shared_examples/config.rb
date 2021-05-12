shared_examples 'openondemand::config' do |_facts|
  context 'hook.env' do
    let(:params) { { pun_pre_hook_root_cmd: '/dne/hook.sh' } }

    it 'has default hook contents' do
      is_expected.to contain_file('/etc/ood/config/hook.env').with(
        ensure: 'file',
        owner: 'root',
        group: 'root',
        mode: '0600',
        show_diff: 'false',
        content: '',
      )
    end

    context 'with hook config defined' do
      let(:params) do
        {
          pun_pre_hook_root_cmd: '/dne/hook.sh',
          oidc_client_id: 'ondemand',
          oidc_client_secret: 'secret',
          hook_env_config: {
            'K8S_USERNAME_PREFIX' => 'dev',
            'NAMESPACE_PREFIX' => 'user-',
            'NETWORK_POLICY_ALLOW_CIDR' => '192.168.0.1/24',
            'IDP_ISSUER_URL' => 'https://idp.example.com/auth/realms/main/protocol/openid-connect/token',
            'IMAGE_PULL_SECRET' => 'private-docker-registry',
            'REGISTRY_DOCKER_CONFIG_JSON' => '/etc/docker-registry-auth/robot-ondemand-read.json',
            'USE_JOB_POD_REAPER' => true,
          },
        }
      end

      it 'has expected content' do
        verify_contents(catalogue, '/etc/ood/config/hook.env', [
                          'CLIENT_ID="ondemand"',
                          'CLIENT_SECRET="secret"',
                          'K8S_USERNAME_PREFIX="dev"',
                          'NAMESPACE_PREFIX="user-"',
                          'NETWORK_POLICY_ALLOW_CIDR="192.168.0.1/24"',
                          'IDP_ISSUER_URL="https://idp.example.com/auth/realms/main/protocol/openid-connect/token"',
                          'IMAGE_PULL_SECRET="private-docker-registry"',
                          'REGISTRY_DOCKER_CONFIG_JSON="/etc/docker-registry-auth/robot-ondemand-read.json"',
                          'USE_JOB_POD_REAPER="true"',
                        ])
      end
    end
  end
end
