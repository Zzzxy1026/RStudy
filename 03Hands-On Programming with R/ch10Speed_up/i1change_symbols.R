change_symbols <- function(vec) {
    for(i in 1: length(vec)){
        if (vec[i] == 'DD') {
            vec[i] <- 'joker'
         } else if (vec[i] == 'C') {
            vec[i] <- 'ace'
         } else if (vec[i] == '7') {
            vec[i] <- 'king'
         } else if (vec[i] == 'B') {
            vec[i] <- 'queen'
         } else if (vec[i] == 'BB') {
            vec[i] <- 'jack'
         } else if (vec[i] == 'BBB') {
            vec[i] <- 'ten'
         } else {
            vec[i] <- 'nine'
         }
    }
    vec
}

vec <- c('DD', 'C', '7', 'B', 'BB', 'BBB', '0')
change_symbols(vec)

many <- rep(vec, 1000000)

system.time(change_symbols(many))

change_vec <- function(vec) {
    vec[vec == 'DD'] <- 'joker'
    vec[vec == 'C'] <- 'ace'
    vec[vec == '7'] <- 'king'
    vec[vec == 'B'] <- 'queen'
    vec[vec == 'BB'] <- 'jack'
    vec[vec == 'BBB'] <- 'ten'
    vec[vec == '0'] <- 'nine'

    vec
}
system.time(change_vec(many))

change_vec2 <- function(vec) {
    tb <- c('DD' = 'joker', 'C' = 'ace', '7' = 'king',
            'B' = 'queen', 'BB' = 'jack', '0' = 'nine')
    unname(tb[vec])
}
system.time(change_vec2(many))
