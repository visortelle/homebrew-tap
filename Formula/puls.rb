class Puls < Formula
  desc "The simplest way to run a local multi-cluster multi-broker Apache Pulsar instance"
  homepage "https://github.com/visortelle/puls"
  url "https://github.com/visortelle/puls/archive/ec38d02a45548d7615f5d2fdaf6cf7a50f244c1e.tar.gz"
  sha256 "c5dcfdfb19fa315f39092d411e98ebcfcb6801fb3beb6d183f5f85317bbfa78f"
  version "0.1.0"
  license "Apache-2.0"
  head "https://github.com/visortelle/puls.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args

    # generate_completions_from_executable(bin/"rg", "--generate", base_name: "rg", shell_parameter_format: "complete-")
    # (man1/"rg.1").write Utils.safe_popen_read(bin/"rg", "--generate", "man")
  end

  test do
    system "#{bin}/puls", "create", testpath
  end
end
