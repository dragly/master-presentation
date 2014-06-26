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
        id: firstSlide
        Heading {
            anchors {
                verticalCenterOffset: -parent.height * 0.1
            }

            text: "Bridging Quantum Mechanics\nand Molecular Dynamics\nwith Artificial Neural Networks"
        }
        Text {
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: frontPageSupervisorsText.top
            anchors.bottomMargin: parent.height * 0.05
            font.family: firstSlide.titleFontFamily
            font.pixelSize: firstSlide._titleFontSize * 0.5
            lineHeight: 1.2
            horizontalAlignment: Text.Center
            wrapMode: Text.Wrap
            text: "Svenn-Arne Dragly\nUniversity of Oslo\nJune 2014"
        }
        Text {
            id: frontPageSupervisorsText
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            font.family: firstSlide.titleFontFamily
            font.pixelSize: firstSlide._titleFontSize * 0.425
            lineHeight: 1.4
            horizontalAlignment: Text.Center
            wrapMode: Text.Wrap
            text: "Supervisors: Morten Hjorth-Jensen and Anders Malthe-Sørenssen"
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
                title: "Quantum Mechanics"
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/ch4-electrostatic-potential.png"
                }
            },
            UpperRightSlide {
                title: "Molecular Dynamics"
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
        delayedContent: [
            UpperLeftSlide {
                title: "Molecular Dynamics"
                centeredText: "Classical potentials\nand newtonian mechanics"
            },
            LowerLeftSlide {
                centeredText: "Particles defined by position, velocity and type.\n" +
                              "Step-wise time-integration.\n" +
                              "Forces from potential:"
                Latex {
                    anchors {
                        bottom: parent.bottom
                        bottomMargin: parent.height * 0.1
                        horizontalCenter: parent.horizontalCenter
                        centerIn: undefined
                    }
                    width: parent.width * 0.2
                    text: "$$F = -\\nabla V$$"
                }
            },
            UpperRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/emdee-5.png"
                }
            }
        ]
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

    UpperLeftSlide {
        title: "How Do We Define a Potential?"
        centeredText: "From experiments\nand/or quantum mechanics"
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
            Item {
                anchors.fill: parent
                LowerRightSlide {
                    BorderedImage {
                        anchors.fill: parent
                        source: "../../images/argon-crystallization-energy-pressure.png"
                    }
                }
                UpperRightSlide {
                    centeredText: "Phase change at about 90K.\n" +
                                  "True boiling point: 87K.\n" +
                                  "True melting point: 84K."
                }
            },
            LowerLeftSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/argon-crystallization-focus-blur.png"
                }
            }
        ]
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

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Electron Density"
                centeredText: "Live!"
            },
            Item {
                anchors.fill: parent
                UpperRightSlide {
                    BorderedImage {
                        anchors {
                            left: parent.left
                            right: parent.right
                            bottom: h2oTitle2.top
                            top: parent.top
                        }
                        source: "../../images/highcontrast.png"
                    }
                    Latex {
                        id: h2oTitle2
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
                            bottom: nh3Title2.top
                            top: parent.top
                        }
                        source: "../../images/nh3-orbital5-cropped.png"
                    }
                    Latex {
                        id: nh3Title2
                        anchors {
                            bottom: parent.bottom
                            centerIn: undefined
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: parent.width * 0.1
                        text: "NH$_3$"
                    }
                }
                LowerRightSlide {
                    BorderedImage {
                        anchors {
                            left: parent.left
                            right: parent.right
                            bottom: o2Title2.top
                            top: parent.top
                        }
                        source: "../../images/o2-orbital-15-high-contrast-cropped.png"
                    }
                    Latex {
                        id: o2Title2
                        anchors {
                            bottom: parent.bottom
                            centerIn: undefined
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: parent.width * 0.07
                        text: "O$_2$"
                    }
                }
            }
        ]
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

    Slide {
        UpperLeftSlide {
            title: "Volume Rendering of Density"
            centeredText: "Rays are traced through a cube of volume data.\n"+
                          "Values of the data are accumulated and define the intensity and color of a pixel."
        }
        UpperRightSlide {
            BorderedImage {
                anchors.fill: parent
                source: "../../images/raytracing.png"
            }
        }
    }

    Slide {
        delayedContent: [
            UpperLeftSlide {
                title: "Millions of Atoms"
                centeredText: "Live demo!"
            },
            UpperRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/oculusqt3d-3.png"
                }
            }
        ]
    }

    UpperLeftSlide {
        title: "Virtual Reality"
        centeredText: "Live demo!"
    }

    UpperLeftSlide {
    }

}

// TODO: Check thesis for more bullets!


