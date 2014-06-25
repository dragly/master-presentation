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
        delayedContent: [
            UpperLeftSlide {
                title: "Booyah"
                centeredText: "WOop"
            }
        ]
    }

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
            UpperRight {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/oculusqt3d-5.png"
                }
            },
            LowerLeft {
                Text {
                    width: parent.width
                    anchors.centerIn: parent
                    text: "energy,\nforce,\nelectron density"
                    horizontalAlignment: Text.Center
                    font.pixelSize: multiscaleSlide._baseFontSize / 2
                    font.family: multiscaleSlide.contentFontFamily
                    font.weight: Font.Light
                    color: multiscaleSlide.slideTextColor
                    wrapMode: Text.Wrap
                }
            },
            LowerRight {
                Text {
                    width: parent.width
                    anchors.centerIn: parent
                    text: "temperature,\npressure,\npermeability"
                    horizontalAlignment: Text.Center
                    font.pixelSize: multiscaleSlide._baseFontSize / 2
                    font.family: multiscaleSlide.contentFontFamily
                    font.weight: Font.Light
                    color: multiscaleSlide.slideTextColor
                    wrapMode: Text.Wrap
                }
            }
        ]
    }

    UpperLeftSlide {
        title: "Problems"
        centeredText: "Expensive details and many atoms"
    }

    UpperLeftSlide {
        title: "Goal"
        centeredText: "Build a bridge between the two scales\nwith artificial neural networks"
    }

    // -----------------------------------------------
    // -----------  Molecular dynamics ---------------
    // -----------------------------------------------

    UpperLeftSlide {
        Heading {
            text: "Molecular Dynamics"
        }
    }

    UpperLeftSlide {
        title: "Molecular Dynamics"
        centeredText: "Newtonian mechanics and classical potentials"
    }

    UpperLeftSlide {
        title: "Classical Potentials"
        Latex {
            text: "$$V(\\mathbf{r}) " +
                  " = \\sum_{k=1}^{N} V_{1}(\\mathbf{r}_{k})" +
                  " + \\sum_{k<l}^{N} V(\\mathbf{r}_{k}, \\mathbf{r}_{l})" +
                  " + \\sum_{k<l<m}^{N} V(\\mathbf{r}_{k}, \\mathbf{r}_{l}, \\mathbf{r}_{m})$$"
        }
    }

    UpperLeftSlide {
        title: "Two-body Terms"
        Latex {
            width: parent.width * 0.5
            text: "$$ V_{2}(\\mathbf{r}_{i}, \\mathbf{r}_{j})" +
                  " = V_{2}(r_{ij})$$"
        }
    }

    UpperLeftSlide {
        title: "Lennard-Jones"
        Latex {
            width: parent.width * 0.5
            text: "$$V_{\\mathrm{LJ}}(r)" +
                  " = 4\\epsilon \\left ( \\frac{\\sigma^{12}}{r^{12}} - \\frac{\\sigma^{6}}{r^{6}} \\right)$$"
        }
    }

    UpperLeftSlide {
        title: "Three-Body Terms"
        Latex {
            width: parent.width * 0.7
            text: "$$ V_{3}(\\mathbf{r}_{i}, \\mathbf{r}_{j}, \\mathbf{r}_{k})" +
                  " = V_{3}(r_{ij}, r_{ik}, \\theta_{jik})$$"
        }
    }

    UpperLeftSlide {
        title: "Measurements"
        centeredText: "Statistical sampling of pressure and temperature"
    }

    UpperLeftSlide {
        title: "Modifications"
        centeredText: "Thermostats, volume changes, friction, ..."
    }

    UpperLeftSlide {
        title: "Does It Make Sense?"
        centeredText: "Is the potential reasonable?"
    }

    UpperLeftSlide {
        title: "Where Does It Come From?"
        centeredText: "Experiments and/or quantum mechanics"
    }

    UpperLeftSlide {
        title: "Results with Argon"
        centeredText: "LJ is a good approximation"
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
        centeredText: "Screenshots! Live?"
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

    UpperLeftSlide {
        title: "Training"
        centeredText: "Trained to reproduce results"
    }

    UpperLeftSlide {
        title: "Neurons"
        centeredText: "The neuron consists of"
    }

    UpperLeftSlide {
        title: "Neural Network"
        centeredText: "Connected neurons"
    }

    UpperLeftSlide {
        title: "Neural Network"
        centeredText: "Input/output"
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


