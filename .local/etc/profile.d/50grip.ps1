$GripCmd = "grip"
$Token = token "github/grip"
if ($Token) {
  $GripCmd += " --user=ccheetham --pass=$Token"
}

function Grip {
    pipenv run $GripCmd $Args
}

