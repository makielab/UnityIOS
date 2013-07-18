require 'formula'

class IdeviceAppRunner < Formula
  homepage 'https://github.com/crackleware/idevice-app-runner'
  url 'https://github.com/storoj/idevice-app-runner/archive/81e76bee83.tar.gz'
  sha1 'ebd347337644bc10c069ac684554b0bf14a40d6c'
  version '81e76bee83'

  depends_on 'libimobiledevice'

  def install
    system "#{ENV.compiler} -g -pthread idevice-app-runner.c -o idevice-app-runner -limobiledevice"
    bin.install 'idevice-app-runner'
  end
end
