module.exports = {
  apps: [
    {
      name: "FRONT-DEV",
      script: "./node_modules/next/dist/bin/next",
      args: "start -p 3102",
      cwd: "./",
      instances: 1, //fork 사용시 필수
      exec_mode: "fork", //cluster -> 멀티 프로세스 모드 가능 (cpu 할당 가능)
      autorestart: true,
      listen_timeout: 50000,
      kill_timeout: 5000,
    },
  ],
};
