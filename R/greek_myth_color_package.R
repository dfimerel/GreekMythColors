

#' Complete list of palettes
#' Use names(myth_palettes) to return all possible palette names.
#' Use \code{\link{myth_palettes}} to construct palettes of desired length.
#'
#' @export
myth_palettes <- list(
  Danae = c("#926e58", "#606266", "#5e7791", "#b45c44"),
  Birth_Venus = c("#798873", "#F2D06B", "#D9A86C", "#F2E6D8", "#A65341"),
  Three_Graces = c("#6D8C87", "#D9AF62", "#F2DAAC", "#593202", "#401E01"),
  Narcissus = c("#1F473E", "#F2DBAE", "#593718", "#BF8563", "#6F6740"),
  Primavera =c("#D9BD9C", "#A67C58", "#A62C21", "#590202", "#777F82"),
  Perseus_Andromeda = c("#F2C288", "#A65729", "#592B1B", "#8C241B"),
  Medusa = c("#403813", "#D99D55", "#BF7534", "#592B11"),
  Garden_Hesperides = c("#F2C230", "#D97C2B", "#D95829", "#BF3636", "#7D3C12"),
  Galatea = c("#2E5955", "#93BFBB", "#D9B18F", "#BF7160", "#BF3939"),
  Oedipus_Sphinx = c("#4F5951", "#A68358", "#A6290D", "#506F60"),
  Lament_Icarus = c("#F2C166", "#F2D0A7", "#8C6542", "#59362E"),
  Ulysses_Sirens = c("#1E4359", "#DFF2ED", "#BF861B", "#736B62", "#733630"),
  Prometheus_Bound = c("#BFAF8F", "#BF814B", "#40342A", "#234A59", "#733D29"),
  Orpheus_Eurydice = c("#8E8753", "#49524F", "#BF9056", "#403027", "#A6432D"),
  Fall_Phateon = c("#595854", "#D9BF8F", "#4D5A53", "#593622", "#873621"),
  Bacchus_Ariadne = c("#425B8C", "#607EA6", "#BFAD75", "#8C4239", "#8C5637"),
  Apollo_Daphne = c("#A68549", "#734D1F", "#98ACAB", "#A63F3F")
)




# Function for generating palettes

#' Greek Myth Palette Generator
#'
#' Color palettes inspired by paintings depicting stories of Greek mythology.
#'
#' @param name Name of Palette.
#' @param n Number of desired colors. If number of requested colors is beyond the scope of the palette,
#' colors are automatically interpolated. If n is not provided, the length of the palette is used.
#' @param type Either "continuous" or "discrete". Use continuous if you want to automatically
#' interpolate between colors.
#' @return A vector of colors.
#' @examples
#' GreekMyth_palette("Birth_Venus")
#'
#' GreekMyth_palette("Birth_Venus", n=3)
#'
#' library(ggplot2)
#' ggplot(data=iris, aes(x=Species, y=Petal.Length, fill=Species)) +
#' geom_violin() +
#' scale_fill_manual(values=GreekMyth_palette("Birth_Venus", 3))
#'
#' ggplot(data=iris, aes(x=Sepal.Length, y=Sepal.Width, color=Species)) +
#' geom_point(size=2) +
#' scale_color_manual(values=GreekMyth_palette("Birth_Venus", 3))
#'
#' @keywords colors
#' @export
GreekMyth_palette <- function(name, n, type = c("discrete", "continuous")) {

  pal <- myth_palettes[[name]]


  if (is.null(pal)){
    stop("Palette not found.")
  }

  if (missing(n)) {
    n <- length(pal)
  }

  if (missing(type)) {
    if(n > length(pal)){type <- "continuous"}
    else{ type <- "discrete"}
  }
  type <- match.arg(type)


  if (type == "discrete" && n > length(pal)) {
    stop("Number of requested colors greater than what discrete palette can offer, \n  use as continuous instead.")
  }


  out <- switch(type,
                continuous = grDevices::colorRampPalette(pal)(n),
                discrete = pal[1:n]
  )
  structure(out, class = "palette", name = name)

}


# Function for printing the myth

#' Get Long Text Description
#'
#' @param name Name of the variable
#' @return A long text description
#' @examples
#' GreekMyth_story("Birth_Venus")
#' @export
GreekMyth_story <- function (name) {

  if (missing(name)) {
    stop("Error: Please provide a valid name.")
  }

  valid_names <- c("Danae","Birth_Venus", "Three_Graces","Narcissus","Perseus_Andromeda","Medusa","Garden_Hesperides",
                   "Galatea","Oedipus_Sphinx","Lament_Icarus","Ulysses_Sirens","Prometheus_Bound","Orpheus_Eurydice","Fall_Phateon","Bacchus_Ariadne","Apollo_Daphne")
  if (!(name %in% valid_names)) {
    stop("Error: The provided name is not recognized. Please choose from: Danae, Birth_Venus,Three_Graces,Narcissus,Perseus_Andromeda,Medusa,Garden_Hesperides,Galatea,Oedipus_Sphinx,Lament_Icarus,Ulysses_Sirens,Prometheus_Bound,Orpheus_Eurydice,Fall_Phateon,Bacchus_Ariadne,Apollo_Daphne")
  }

  if (name=="Danae")
    cat("The story goes like this: \nAn oracle warned King Acrisius of Argos that he would be killed by his own grandson. Fearing for his life, the king imprisoned his daughter Danae in a bronze tower to prevent her from having any children. The god Zeus desired Danae and, consumed by his love, decided to reach her. He transformed himself into a shower of golden rain that seeped through the roof of the tower, impregnating Danae. From this union, Danae gave birth to a son named Perseus. When King Acrisius discovered the truth, he feared the prophecy coming true. He sealed Danae and Perseus in a wooden chest and cast them into the sea. However, the chest miraculously floated ashore on the island of Seriphos, where it was found by a fisherman. Danae and Perseus were raised on the island. As Perseus grew up, he became a skilled warrior. He was eventually sent on a quest by the king of Seriphos to slay the Gorgon Medusa. Perseus successfully completed the task, returning with Medusa's head, which had the power to turn anyone who looked at it into stone. Tragically, this eventually fulfilled the prophecy, as King Acrisius accidentally crossed paths with Perseus and met his demise accidentally when he saw the Gorgon's head.")

  if (name=="Birth_Venus")
    cat("The story goes like this: \nTitan Cronus, at the urging of his mother Gaia, castrates his father Uranus, and Uranus's severed genitals are cast into the sea. From the churning foam that emerges, Venus rises fully grown and remarkably beautiful. Zephyr, the west wind, and the Horae, goddesses of the seasons, guide her to the shores of Cyprus on a scallop shell. Upon her arrival, she was received by the Horae, who adorned her with flowers and welcomed her into the world.")

  if (name=="Three_Graces")
    cat("The story goes like this: \nTraditionally, there were three Graces: Aglaia (brilliance), Euphrosyne (joy), and Thalia (bloom/abundance). They were associated with various aspects like beauty, charm, creativity, festivity, and social graces. They often accompanied other deities, particularly Aphrodite (goddess of love) and the Muses (goddesses of the arts). While not central figures in many myths, they appear in various stories, often symbolizing harmony, joy, and the beauty of life. For example, they are sometimes depicted as adorning goddesses or attending to celebrations.")

  if (name=="Narcissus")
    cat("The story goes like this: \nNarcissus, admired for his beauty but possessing arrogance and indifference, rejects the affections of others. Echo, a wood nymph cursed by Hera to only repeat words, falls in love with Narcissus but fades away when her love goes unreciprocated. As punishment for his cruelty, the goddess Nemesis curses Narcissus to fall in love with his own reflection. Discovering his reflection in a pool, Narcissus becomes consumed by his beauty and neglects his needs, wasting away from obsessive longing. In some versions, he dies heartbroken by the pool; in others, he transforms into the narcissus flower, forever admiring his own reflection at the water's edge. The myth serves as a cautionary tale about vanity, unattainable love, and the consequences of rejecting the affections of others.")

  if (name=="Primavera")
    cat("Although the exact meaning and intentions behind the painting remain unclear, the most widely accepted interpretation is that the painting depicts an allegory of spring, celebrating the season's beauty, fertility, and the renewal of life. The main figures are the following: Zephyr, the god of the west wind, pursues Chloris, the nymph of flowers. He transforms her into Flora, the goddess of spring, who scatters flowers across the meadow. Venus, the goddess of love and beauty, stands at the center, symbolizing the life-giving force of love. The Three Graces, representing charm, beauty, and the arts, dance in a circle. Mercury, the messenger god, stands at the far left, dispersing the last clouds of winter with his staff.")

  if (name=="Perseus_Andromeda")
    cat("The story goes like this: \nCassiopeia's boast that her daughter Andromeda surpassed the Nereids angered Poseidon, who sent a sea serpent to punish the kingdom. An oracle declared that sacrificing Andromeda would appease Poseidon, leading her parents to chain her to a rock on the coast. Perseus, on his quest to slay Medusa, encountered Andromeda and learned of her impending sacrifice. He offered to save her by defeating the sea serpent in exchange for her hand in marriage. Using divine gifts, including a mirrored shield, Perseus triumphed over the serpent, freeing Andromeda. Despite challenges from her promised suitor Phineus, Perseus proved his worth in battle and won Andromeda's hand.")

  if (name=="Medusa")
    cat("The story goes like this: \nMedusa, once a beautiful priestess, was cursed by Athena, transforming her hair into snakes and granting her the petrifying gaze. Some myths claim she was violated in Athena's temple, while others depict her as boastful, leading to her punishment. Despite her monstrous appearance, Medusa remained a victim, not a villain, forever bound to her curse. The hero Perseus, aided by the gods, eventually beheaded Medusa, using her severed head as a weapon. From her severed neck sprang the winged horse Pegasus and the giant Chrysaor, symbolizing the duality of creation and destruction.")

  if (name=="Garden_Hesperides")
    cat("The story goes like this: \nThe Garden of the Hesperides, owned by Hera and situated at the edge of the world or in the Atlas Mountains, is renowned for its golden apples believed to grant immortality. The apples' origin varies, depicted as a wedding gift from Gaia or Hera's exclusive possession nurtured by the Hesperides. These nymphs, either daughters of Atlas and Hesperis or other deities, guard the garden. Figures like Heracles, who retrieved the apples for Eurystheus during his labors, and Atalanta, who raced for the apples against Hippomenes, sought this coveted prize. The myth showcases the enduring allure of the golden apples and the challenges faced by those attempting to claim them.")

  if (name=="Galatea")
    cat("The story goes like this: \nGalatea was a beautiful sea nymph, daughter of Nereus and Doris. Acis was a handsome young shepherd who fell deeply in love with Galatea. Their love was mutual, and they spent their days together by the sea. The monstrous Cyclops, Polyphemus, also fell in love with Galatea but was relentlessly rejected. Consumed by jealousy, Polyphemus saw Acis and Galatea together and, in a rage, hurled a massive rock at them. The rock crushed Acis, killing him instantly. Witnessing her lover's death, Galatea was overcome with grief. She pleaded with the gods to ease her suffering. In response, the gods transformed Acis' blood into a cool stream that flowed into the sea, forever uniting him with Galatea in her watery domain.")

  if (name=="Oedipus_Sphinx")
    cat("The story goes like this: \nKing Laios and Queen Jocasta, fearing a prophecy, expose their son Oedipus, who is later adopted by King Polybus and Queen Merope of Corinth. Oedipus, learning of the prophecy, flees Corinth, arriving in Thebes. He solves the Sphinx's riddle, becomes king, and unwittingly marries his mother, Jocasta. A plague strikes Thebes, leading Oedipus to investigate and unveil his horrifying past. Jocasta, realizing the truth, takes her own life, and Oedipus, in despair, blinds himself. The story encapsulates Oedipus's tragic journey, marked by fate, prophecy, and the consequences of unknowingly fulfilling a dark destiny.")

  if (name=="Lament_Icarus")
    cat("The story goes like this: \nDaedalus, a skilled craftsman, and his son Icarus were imprisoned on the island of Crete. To escape, Daedalus crafted wings from feathers and wax for both of them. Before their flight, Daedalus warned Icarus not to fly too close to the sun, as the heat would melt the wax holding the feathers together. However, Icarus, overcome by the thrill of flight, soared higher and higher. As Icarus disregarded his father's warning, the sun's heat melted the wax on his wings, causing them to disintegrate. He plunged into the sea and drowned.")

  if (name=="Ulysses_Sirens")
    cat("The story goes like this: \nAfter the Trojan War, Odysseus faces the challenge of passing the Sirens, whose enchanting songs lure sailors to their demise. Circe advises him to use beeswax to plug his crew's ears and ties himself to the mast to resist the allure. The Sirens sing promises of pleasure and knowledge, but Odysseus, despite being deeply affected, successfully resists their temptation with the crew's help. The ship sails past unharmed, and the crew removes the wax from their ears. This episode in The Odyssey showcases Odysseus's clever strategy and willpower in overcoming the dangerous allure of the Sirens, highlighting his resourcefulness in navigating the challenges on his journey home to Ithaca.")

  if (name=="Prometheus_Bound")
    cat("The story goes like this: \nPrometheus was a Titan, a powerful being who pre-dated the Olympian gods. He sided with Zeus in the overthrow of the Titans and became a champion of humanity. Feeling humans deserved better, Prometheus defied Zeus by stealing fire from Mount Olympus and gifting it to humanity. Fire provided warmth, protection from predators, and the ability to cook food and develop tools, significantly improving human lives. Enraged by Prometheus' disobedience, Zeus condemned him to a horrific punishment. He had Prometheus chained to a rock on a remote mountain peak, where an eagle would come daily to tear at his regenerating liver, causing him immense pain.Despite the suffering, Prometheus remained defiant. He refused to reveal to Zeus the identity of a Titan who prophesied Zeus' downfall, further angering the god. Centuries later, the hero Heracles, with Zeus' consent, intervened and freed Prometheus from his torment. However, some versions say Prometheus remained forever marked by his ordeal, bearing a ring on his finger as a reminder of his chains.")

  if (name=="Orpheus_Eurydice")
    cat("The story goes like this: \nOrpheus, son of Apollo and the muse Calliope, was renowned for his exceptional musical skills. His lyre playing and singing could charm humans, animals, and even the gods. Orpheus fell deeply in love with Eurydice and they were married. However, their happiness was short-lived. On their wedding day, while fleeing the advances of Aristaeus, a shepherd, Eurydice was bitten by a snake and died. Overcome with grief, Orpheus refused to accept Eurydice's death. He ventured into the underworld, the realm of Hades and Persephone, determined to bring her back. Orpheus's music filled the underworld with such beauty and sorrow that it touched the hearts of Hades and Persephone. They agreed to allow Eurydice to return to the living world, on one condition: Orpheus had to lead Eurydice out of the underworld without looking back at her until they both reached the surface. This symbolized his unwavering faith in her presence and his ability to bring her back. As they neared the exit from the underworld, Orpheus, overcome by doubt and longing, turned back to see if Eurydice was truly following. However, she had not yet fully crossed the threshold, and this single glance condemned her to return to the underworld forever. Devastated by his failure and Eurydice's permanent loss, Orpheus retreated from the world, finding solace only in his music. He eventually met a tragic end, but his story and his music continued to inspire generations.")

  if (name=="Fall_Phateon")
    cat("The story goes like this: \nPhaeton was the son of Helios, the sun god, and Clymene, an Oceanid nymph. He grew up hearing tales of his father's immense power and the magnificent chariot that carried the sun across the sky. Phaeton faced taunts from other children who questioned his divine heritage. Consumed by doubt, he sought confirmation from his mother. Driven by a desire to prove himself, Phaeton demanded proof of his lineage from Helios. He pleaded with his father to allow him to drive the sun chariot for just one day. Helios, recognizing the immense power and danger of the chariot, initially refused. However, bound by an oath to fulfill any request on his son's birthday, he reluctantly agreed. Overwhelmed by the power of the celestial horses and the immense heat radiating from the sun, Phaeton quickly lost control of the chariot. The chariot veered off course, bringing scorching heat to some parts of the earth and freezing cold to others. Crops withered, rivers dried up, and entire regions faced devastation. Witnessing the chaos unfolding, Zeus, the king of the gods, intervened to prevent further catastrophe. He hurled a thunderbolt, striking down Phaeton and bringing the chariot under control.Phaeton's fall resulted in his death and served as a stark reminder of the dangers of hubris and the importance of respecting the boundaries of power. His grieving sisters, the Heliades, were transformed into poplar trees, forever weeping amber tears that solidified into precious stones.")

  if (name=="Bacchus_Ariadne")
    cat("The story goes like this: \nPrincess of Crete, she helped the Athenian hero Theseus escape the labyrinth and defeat the Minotaur. However, Theseus betrayed her and abandoned her on the island of Naxos. Arriving on Naxos, Bacchus, the god of wine and vegetation, finds Ariadne heartbroken and distraught. He falls in love with her at first sight and offers her comfort and solace.")

  if (name=="Apollo_Daphne")
    cat("The story goes like this: \nApollo, the god of music, poetry, light, and healing, falls deeply in love with the nymph Daphne. However, Daphne has sworn to remain a virgin and dedicates herself to the goddess Artemis, the huntress. Apollo pursues Daphne relentlessly, but she refuses his advances and flees in terror. When Apollo is about to catch her, Daphne cries out to her father, the river god Peneus, for help. Peneus transforms Daphne into a laurel tree just as Apollo reaches her. Devastated, Apollo cannot undo the transformation but embraces the laurel tree, declaring it his sacred plant and the source of his victory wreaths.")

}





#' @export
#' @importFrom grDevices rgb
#' @importFrom graphics rect par image text
print.palette <- function(x, ...) {
  n <- length(x)
  old <- par(mar = c(0.5, 0.5, 0.5, 0.5))
  on.exit(par(old))

  image(1:n, 1, as.matrix(1:n), col = x,
        ylab = "", xaxt = "n", yaxt = "n", bty = "n")

  rect(0, 0.9, n + 1, 1.1, col = grDevices::rgb(1, 1, 1, 0.8), border = NA)
  text((n + 1) / 2, 1, labels = attr(x, "name"), cex = 1, family = "serif")
}




