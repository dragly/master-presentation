//import Qt.labs.presentation 1.0
import QtQuick 2.2
import LatexPresentation 1.0
import QtQuick.Controls 1.1
import QtMultimedia 5.0
import QtGraphicalEffects 1.0

TransitionPresentation
{
    id: presentation

    focus: true

    transitionTime: 500

    width: 800
    height: 600

    textColor: "black"

    LinearGradient {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#f7fcfd" }
            GradientStop { position: 1.0; color: "#f7fcf0" }
        }
    }

    UpperLeftSlide {
        Heading {
            text: "Bridging Quantum Mechanics\nand Molecular Dynamics\nwith Artificial Neural Networks"
        }
    }

    // -----------------------------------------------
    // --------------- Introduction ------------------
    // -----------------------------------------------

    Slide {
        id: multiscaleSlide
        anchors.fill: parent
        delayedContent: [
            UpperLeftSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/ch4-electrostatic-potential.png"
                }
            },
            UpperRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/oculusqt3d-5.png"
                }
            },
            LowerLeftSlide {
                centeredText: "energy,\nforce,\nelectron density"
            },
            LowerRightSlide {
                centeredText: "temperature,\npressure,\npermeability"
            }
        ]
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Problem"
                centeredText: "detailed calculations = expensive\nmany atoms = expensive"
            },
            LowerLeftSlide {
                centeredText: "details + many atoms = unaffordable"
            },
            UpperRightSlide {
                title: "Goal"
                centeredText: "Build a bridge between the two scales\nwith artificial neural networks"
            }
        ]
    }


    // -----------------------------------------------
    // -----------  Molecular dynamics ---------------
    // -----------------------------------------------

    UpperLeftSlide {
        Heading {
            text: "Molecular Dynamics"
        }
    }

    Slide {
        UpperLeftSlide {
            title: "Molecular Dynamics"
            centeredText: "Classical potentials and newtonian mechanics"
        }
        UpperRightSlide {
            BorderedImage {
                anchors.fill: parent
                source: "../../images/emdee-5.png"
            }
        }
        LowerRightSlide {
            Latex {
                width: parent.width * 0.3
                text: "$$F = -\\nabla V$$"
            }
        }
    }

    UpperLeftSlide {
        title: "Classical Potentials"
        Latex {
            text: "$$V(\\mathbf{r}) " +
                  " = \\sum_{i} V_{1}(\\mathbf{r}_{i})" +
                  " + \\sum_{i<j} V_{2}(\\mathbf{r}_{i}, \\mathbf{r}_{j})" +
                  " + \\sum_{i<j<k} V_{3}(\\mathbf{r}_{i}, \\mathbf{r}_{j}, \\mathbf{r}_{k})$$"
        }
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Two-Body Terms"
                Latex {
                    width: parent.width * 0.5
                    text: "$$ V_{2}(\\mathbf{r}_{i}, \\mathbf{r}_{j})" +
                          " = V_{2}(r_{ij})$$"
                }
            },
            Item {
                anchors.fill: parent
                UpperRightSlide {
                    title: "Lennard-Jones"
                    Latex {
                        width: parent.width * 0.5
                        text: "$$V_{\\mathrm{LJ}}(r)" +
                              " = 4\\epsilon \\left ( \\frac{\\sigma^{12}}{r^{12}} - \\frac{\\sigma^{6}}{r^{6}} \\right)$$"
                    }
                }
                LowerRightSlide {
                    BorderedImage {
                        anchors.fill: parent
                        source: "../../images/lennard-jones.png"
                    }
                }
            }
        ]
    }

    Slide {
        UpperLeftSlide {
            title: "Three-Body Terms"
            Latex {
                width: parent.width * 0.7
                text: "$$ V_{3}(\\mathbf{r}_{i}, \\mathbf{r}_{j}, \\mathbf{r}_{k})" +
                      " = V_{3}(r_{ij}, r_{ik}, \\theta_{jik})$$"
            }
        }
        UpperRightSlide {
            Image {
                anchors.fill: parent
                anchors.margins: parent.width * 0.1
                fillMode: Image.PreserveAspectFit
                source: "../../images/trimer-ijk.png"
                antialiasing: true
                smooth: true
            }
        }
    }

    UpperLeftSlide {
        title: "Does It Make Sense?"
        centeredText: "Are the results reasonable?"
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Test Case: Argon Crystallization"
                centeredText: "Boiling argon\ncooled slowly"
            },
            LowerLeftSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/argon-crystallization-energy-pressure.png"
                }
            },
            UpperRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/argon-crystallization-focus-blur.png"
                }
            }
        ]
    }

    UpperLeftSlide {
        title: "Where Does It Come From?"
        centeredText: "From experiments and/or quantum mechanics"
    }

    // -----------------------------------------------
    // ------- Computational Quantum Mechanics -------
    // -----------------------------------------------

    UpperLeftSlide {
        Heading {
            text: "Computational\nQuantum Mechanics"
        }
    }

    UpperLeftSlide {
        title: "Assumptions"
        delayPoints: true
        bullets: ["Born-Oppenheimer: classical nuclei",
            "Slater determinant: only exchange correlations"]
    }

    UpperLeftSlide {
        title: "Born-Oppenheimer"
        bullets: ["Nuclei are treated classically",
            "Assumes ground state",
            "Coarse, but good approximation"]
    }

    UpperLeftSlide {
        title: "Hartree-Fock Method"
        centeredText: "Slater determinant, single-particle wave functions"
    }

    UpperLeftSlide {
        title: "Hartree-Fock Method"
        centeredText: "Mean field approximation"
    }

    UpperLeftSlide {
        title: "Electron Density"
        centeredText: "Live!"
    }

    Slide {
        UpperLeftSlide {
            title: "Electrostatic Potential"
            centeredText: "Shows electro- and nucleophilic areas"
        }
        UpperRightSlide {
            BorderedImage {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: h2oTitle.top
                    top: parent.top
                }
                source: "../../images/h2o-electrostatic-potential-bearboat-3-cropped.png"
            }
            Latex {
                id: h2oTitle
                anchors {
                    bottom: parent.bottom
                    centerIn: undefined
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width * 0.1
                text: "H$_2$O"
            }
        }
        LowerLeftSlide {
            BorderedImage {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: ch4Title.top
                    top: parent.top
                }

                source: "../../images/ch4-electrostatic-potential-2.png"
            }
            Latex {
                id: ch4Title
                anchors {
                    bottom: parent.bottom
                    centerIn: undefined
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width * 0.1
                text: "CH$_4$"
            }
        }
        LowerRightSlide {
            BorderedImage {
                anchors {
                    left: parent.left
                    right: parent.right
                    bottom: nh3Title.top
                    top: parent.top
                }
                source: "../../images/nh3-electrostatic-potential.png"
            }
            Latex {
                id: nh3Title
                anchors {
                    bottom: parent.bottom
                    centerIn: undefined
                    horizontalCenter: parent.horizontalCenter
                }
                width: parent.width * 0.1
                text: "NH$_3$"
            }
        }
    }

    UpperLeftSlide {
        title: "Path to Molecular Dynamics"
        centeredText: "Energy to potential energy"
    }

    // -----------------------------------------------
    // --------------- Neural networks ---------------
    // -----------------------------------------------


    UpperLeftSlide {
        Heading {
            text: "Artificial\nNeural Networks"
        }
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Neural Network"
                centeredText: "Connected neurons"
            },
            LowerLeftSlide {
                Image {
                    anchors.fill: parent
                    source: "../../images/network.png"
                    fillMode: Image.PreserveAspectFit
                    antialiasing: true
                    smooth: true
                }
            },
            UpperRightSlide {
                title: "Neuron"
                Latex {
                    width: parent.width * 0.5
                    text: "$$y(\\mathbf{x}) = g \\left ( \\sum_{i=1}^{n} w_{i} x_{i} \\right )$$"
                }
            },
            LowerRightSlide {
                Image {
                    anchors.fill: parent
                    source: "../../images/neuron.png"
                    fillMode: Image.PreserveAspectFit
                    antialiasing: true
                    smooth: true
                }
            }
        ]
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Training"
                centeredText: "Backpropagation"
            },
            UpperRightSlide {
                Image {
                    anchors.fill: parent
                    source: "../../images/split-neuron.png"
                    fillMode: Image.PreserveAspectFit
                    antialiasing: true
                    smooth: true
                }
            }
        ]
    }

    UpperLeftSlide {
        title: "Approximating potentials"
        centeredText: "Show images!"
    }

    UpperLeftSlide {
        title: "Results in Hydrogen Molecules"
        centeredText: "Show images!"
    }

    UpperLeftSlide {
        title: "Hydrogen Dissociation"
        centeredText: "Show results!"
    }

    UpperLeftSlide {
        title: "Future Possibilities"
        centeredText: "Better quantum, better neural"
    }

    // -----------------------------------------------
    // ---------------- Visualization ----------------
    // -----------------------------------------------

    UpperLeftSlide {
        Heading {
            text: "Visualization"
        }
    }

    UpperLeftSlide {
        title: "Volume Rendering of Density"
        centeredText: "Show images!"
    }

    UpperLeftSlide {
        title: "Millions of Atoms"
        centeredText: "Show images!"
    }

    UpperLeftSlide {
        title: "Virtual Reality"
        centeredText: "Show images!"
    }

}

// TODO: Check thesis for more bullets!


