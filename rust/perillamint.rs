use std::fs::File;
use std::fs::metadata;
use std::io::Write;
use std::process::exit;

fn main() {
    let bigfile = "big";
    let metadata = metadata(bigfile);

    let zeros: [u8; 1024] = [0; 1024];
    let mut writesize = zeros.len();

    match metadata {
        Ok(_) => exit(0),
        Err(x) => x
    };
    
    let big = File::create(bigfile);

    let mut bigfile = match big {
        Ok(x) => x,
        Err(_) => exit(0)
    };

    while writesize > 1 {
        let res = bigfile.write(&zeros[0 .. writesize - 1]);

        match res {
            Ok(x) => x,
            Err(_) => {writesize = writesize / 2; 0}
        };
    }
    
    exit(0);
}
