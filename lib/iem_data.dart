class IEMDetail {
  final String image;
  final String brand;
  final String name;
  final double price;
  final String description;
  final String graph;
  final double graphCorrection;
  final String spec;
  final String review;
  const IEMDetail({
    required this.image,
    required this.brand,
    required this.name,
    required this.price,
    required this.description,
    required this.graph,
    required this.graphCorrection,
    required this.spec,
    required this.review,
  });
}

List<IEMDetail> iemDataList = [
  IEMDetail(
    image: "asset/images/oracle_mk3.png",
    brand: "THIEAUDIO",
    name: "Oracle MKIII",
    price: 19691.31,
    description:
        'Keeping in line with its DNA, the Oracle MKIII retains its tuning profile as a real studio monitor. The bass has been restricted to the sub-bass shelf to provide plenty of thump for drummers and bass guitarists, while keeping the mids flat and neutral. Instruments and vocals are perfectly positioned and layered thanks to neutral midrange and our comprehensive 4-way crossover system. The treble has been modified to be smoother than the previous Oracle MKII predecessor, which was one of its main critiques. However, the Oracle MKIII still takes full advantage of the 2 Sonion EST tweeters to deliver all of the microdetails and upper treble extension. ',
    graph: "asset/data/oracle_mkIII.txt",
    graphCorrection: 90.0,
    spec: "Frequency Response: 20Hz - 44kHz\nSensitivity: 99dB (±1dB) @1kHz\nImpedance: 13Ω ± 1Ω\nDrivers: 2DD + 2BA + 2EST\nCrossover: Four-Way\nCable Connectors: 2-pin 0.78mm\nCable Termination: 2.5mm, 3.5mm, 4.4mm (Interchangeable)",
    review: "https://youtu.be/FiA2B6Ph4Uc?si=6Ef6-5oPQTKtoPyU",
  ),
  IEMDetail(
    image: "asset/images/dk3001bd.png",
    brand: "DUNU",
    name: "DK3001BD",
    price: 16715.55,
    description: 'The DUNU DK3001BD connects with your sensory mind, creating a hyperrealistic audio journey that elevates your music listening experience to new heights. Immerse yourself in the world of sound, where every note and nuance resonates with clarity. Featuring a sophisticated combination of 9 drivers, the DK3001BD employs a tribrid configuration of 1 dynamic driver, 4 balanced armatures, and 4 planar units. This intricate design is controlled through a dual-system, four-way precision crossover, delivering precise frequency response, consistent phase alignment, and an authentic musical connection. The DK3001BD\'s housing is meticulously crafted from aerospace-grade aluminum alloy, coated with zirconium ceramic for added durability and a smooth finish. This elegant design not only enhances aesthetics but also contributes to sound quality.',
    graph: "asset/data/dk3001bd.txt",
    graphCorrection: 93.0,
    spec: "Frequency Response: 5Hz - 40kHz\nSensitivity: 108dB/mW (@1kHz) / 122dB/Vrms (@1kHz)\nImpedance: 26Ω\nDrivers: 1DD + 4BA + 4PL\nCrossover: Four-Way\nCable Connectors: 2-pin 0.78mm / MMCX\nCable Termination: 2.5mm, 3.5mm, 4.4mm (Interchangeable)",
    review: "https://youtu.be/C0kRMuVlzKA?si=ycSOqIDwuXaFBNSJ",
  ),
  IEMDetail(
    image: "asset/images/mangird_top.png",
    brand: "XENNS",
    name: "Mangird Top",
    price: 17718.84,
    description: 'XENNS Mangird Top equipped with a Knowles 32406 dual balanced armature driver for ultra-high frequency, two E50D dual balanced armature units for high frequency, two Sonion 2600 series mid-high frequency balanced armature drivers and one 10mm beryllium-coated dynamic driver for bass. XENNS Mangird Top features an airy smooth high frequency, especially when play instruments and vocals, the detailed changes of emotions is so thrilling and moving. For bass, it’s flexible, powerful and dynamic. Three frequencies are divided clear but precise, full of atmosphere and broad soundstage. It could be one of the most appropriate IEMs for rock and roll, popular music or vocals. ',
    graph: "asset/data/mangird_top.txt",
    graphCorrection: 100.0,
    spec: "Frequency Response: 20Hz - 44kHz\nSensitivity: 107/Vrms ± 1db \nImpedance: 25Ω\nDrivers: 1DD + 8BA\nCrossover: Four-Way\nCable Connectors: 2-pin 0.78mm\nCable Termination: 2.5mm, 3.5mm, 4.4mm (Interchangeable)",
    review: "https://youtu.be/rr1sCoLNwGk?si=HiwdwCUW3Om-aSl5",
  ),
];
