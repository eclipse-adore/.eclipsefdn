local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.adore', 'eclipse-adore') {
  settings+: {
    description: "",
    name: "Eclipse Adore project",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('adore') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse ADORe is a ROS based modular software library and toolkit for decision making, planning, control and simulation of automated vehicles supporting CARLA and SUMO.",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "gh-pages",
      gh_pages_source_path: "/docs",
      homepage: "https://eclipse.github.io/adore/",
      topics+: [
        "automated-driving",
        "motion-planning",
        "ros",
        "simulation",
        "vehicle-communication",
        "vehicle-control",
        "vehicle-dynamics"
      ],
      web_commit_signoff_required: false,
      environments: [
        orgs.newEnvironment('github-pages') {
          branch_policies+: [
            "gh-pages"
          ],
          deployment_branch_policy: "selected",
        },
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}