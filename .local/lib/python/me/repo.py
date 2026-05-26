import json
import os
import subprocess
import sys
from urllib.parse import urlparse
from pathlib import Path

class Repo(object):

    def __init__(self, url):
        self.url = url
        if ":" in self.url and not self.url.startswith("http"):
            self.name = self.url.split(":")[1]
        else:
            self.name = urlparse(self.url).path[1:]
        self.user = self.name.split("/")[0]
        self.path = os.path.join(os.environ['ME_CODE_DIR'], self.name)

    def refresh(self):
        GitClient().refresh(self)

    def status(self):
        GitClient().status(self)

    def __str__(self):
        return "%s,%s" % (self.url, self.name)

    def __repr__(self):
        return "Repo[%s]" % self.url


class RepoDB(object):

    def __init__(self, dbpath=None):
        self.dbpath = dbpath if dbpath else os.environ['ME_REPO_CFG']
        self.reload()

    def reload(self):
        self.repo = {}
        for rec in (open(self.dbpath)).readlines():
            rec = rec.strip()
            if rec.startswith("#"):
                continue
            repo = Repo(rec)
            self.repo[repo.name] = repo

    def __len__(self):
        return len(self.repo)

    def __getitem__(self, key):
        return self.repo[key]

    def keys(self):
        return self.repo.keys();


class GitClient(object):

    def refresh(self, repo):
        if os.path.exists(repo.path):
            print("=== updating", repo.name)
            subprocess.Popen(["git", "pull"], cwd=repo.path).wait()
        else:
            print("=== checking out", repo.name)
            parent = Path(repo.path).parent
            os.makedirs(parent, exist_ok=True)
            subprocess.Popen(["git", "clone", repo.url], cwd=parent).wait()

    def status(self, repo):
        print("=== status of", repo.name, repo.url)
        if os.path.exists(repo.path):
            subprocess.Popen(["git", "status"], cwd=repo.path).wait()
        else:
            print("not checked out")


class Command(object):

    def __init__(self, repodb):
        self.repodb = repodb

    def repos(self, names):
        if not names:
            names = sorted(self.repodb.keys())
        repos = []
        for name in names:
            try:
                repos.append(self.repodb[name])
            except KeyError as e:
                print("repo not found:", name)
        return repos

    def info(self, names=[]):
        for repo in self.repos(names):
            print(repo.name)
            print("    path:", repo.path)
            print("    url :", repo.url)

    def refresh(self, names=[]):
        for repo in self.repos(names):
            repo.refresh()

    def status(self, names=[]):
        for repo in self.repos(names):
            repo.status()


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("command",
            choices=["info", "refresh", "status"])
    parser.add_argument("name",
            help="name(s) of target repo (all repos if not specified)",
            nargs="*")
    args = parser.parse_args(sys.argv[1:])
    getattr(Command(RepoDB()), args.command)(args.name)
