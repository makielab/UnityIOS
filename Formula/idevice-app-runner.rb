require 'formula'

class IdeviceAppRunner < Formula
  homepage 'https://github.com/crackleware/idevice-app-runner'
  url 'https://github.com/crackleware/idevice-app-runner/archive/eea86ed362.tar.gz'
  sha1 '92c7a878b88f9eab1b4c24e30a96003abcdd337e'
  version 'eea86ed362'

  depends_on 'libimobiledevice'

  def install
    system "#{ENV.compiler} -g -pthread idevice-app-runner.c -o idevice-app-runner -limobiledevice"
    bin.install 'idevice-app-runner'
  end
end
