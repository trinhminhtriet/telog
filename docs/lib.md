# Usage with `log`

Logram has an implementation of [`log::Logger`](https://crates.io/crates/log).

1. Import telog as library:

```toml
[dependencies]
telog = "2.0"
```

2. Initialize the telog:

```rust
use telog;
use log::{warn, info, Level};

fn main() {
    telog::init(
        Level::Error, // log level
        String::from("1496993932:AAFrF5aTnQEeruljp3ZHqVUSkgVS9Ra_aT8"), // bot token
        String::from("79098882"), // chat ID
        None, // proxy url, if needed
    )
    .unwrap();

    info!("Application started");

    if cfg!(target_os = "windows") {
        warn!("Oh, shi...");
    }
}
```

Or you can use the telog's `log::Logger` implementation itself in the composite logger, e.g. [multi_log](https://crates.io/crates/multi_log):

```rust
use log::{debug, error, info, trace, warn, Level, LevelFilter};
use telog::TelegramLogger;
use simplelog::{self, SimpleLogger};
use multi_log::MultiLogger;

fn main() {
    let simple_logger = SimpleLogger::new(LevelFilter::Warn, simplelog::Config::default());
    let telog = TelegramLogger::new(
        Level::Info,
        String::from("1496993932:AAFrF5aTnQEeruljp3ZHqVUSkgVS9Ra_aT8"),
        String::from("79098882"),
        None,
    )
    .unwrap();

    MultiLogger::init(vec![simple_logger, Box::new(telog)], Level::Info).unwrap();

    debug!("some debug message");
    error!("well, I'm a useless example of code, sad");
}
```

_Warning:_ log records with target starts with `tokio_reactor`, `hyper`, `mio`, `want` or `reqwest` will be skipped, because [limitations in log](https://github.com/rust-lang/log/issues/312).
