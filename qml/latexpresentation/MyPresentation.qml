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

    MultiSlide {
        id: multiscaleSlide
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

    MultiSlide {
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
                centeredText: "Build a bridge between the two scales.\n" +
                              "Maximize both quality and quantity."
            },
            LowerRightSlide {
                title: "How?"
                centeredText: "Machine learning\nwith artificial neural networks."
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

    MultiSlide {
        delayedContent: [
            Item {
                anchors.fill: parent
                UpperLeftSlide {
                    title: "Molecular Dynamics"
                    centeredText: "Classical potentials\nand newtonian mechanics"
                }
                UpperRightSlide {
                    BorderedImage {
                        anchors.fill: parent
                        source: "../../images/emdee-5.png"
                    }
                }
            },
            LowerLeftSlide {
                centeredText: "Atoms defined by\nposition, velocity and type.\n" +
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
            }
        ]
    }

    MultiSlide {
        UpperLeftSlide {
            id: idia
            title: "Molecular Dynamics Implementation"
            centeredText: "General code.\n" +
                          "Built-in selection of potentials.\n" +
                          "Extensible.\n" +
                          "Performance-centric."
        }

        Image {
            anchors {
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                left: parent.horizontalCenter
                rightMargin: parent.width * 0.02
                leftMargin: parent.width * 0.02
                topMargin: parent.height * 0.02
                bottomMargin: parent.height * 0.02
            }

            fillMode: Image.PreserveAspectFit
            source: "../../images/md-implementation-simple.png"
            antialiasing: true
            smooth: true
        }
    }

    MultiSlide {
        delayedContent: [
            UpperLeftSlide {
                title: "Classical Potentials"
                Latex {
                    text: "$$V(\\mathbf{r}) " +
                          " = \\sum_{i} V_{1}(\\mathbf{r}_{i})" +
                          " + \\sum_{i<j} V_{2}(\\mathbf{r}_{i}, \\mathbf{r}_{j})" +
                          " + \\sum_{i<j<k} V_{3}(\\mathbf{r}_{i}, \\mathbf{r}_{j}, \\mathbf{r}_{k}) + \\ldots$$"
                }
            },
            UpperRightSlide {
                title: "How Do We Define a Potential?"
                centeredText: "From experiments\nand/or quantum mechanics"
            }
        ]
    }

    MultiSlide {
        delayedContent: [
            Item {
                anchors.fill: parent
                LowerLeftSlide {
                    Image {
                        anchors.fill: parent
                        anchors.margins: parent.width * 0.2
                        fillMode: Image.PreserveAspectFit
                        source: "../../images/dimer-ij.png"
                        antialiasing: true
                        smooth: true
                    }
                }
                UpperLeftSlide {
                    title: "Two-Body Terms"
                    Latex {
                        width: parent.width * 0.5
                        text: "$$ V_{2}(\\mathbf{r}_{i}, \\mathbf{r}_{j})" +
                              " = V_{2}(r_{ij})$$"
                    }
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

    MultiSlide {
        delayedContent: [
            Item {
                anchors.fill: parent
                UpperLeftSlide {
                    title: "Three-Body Terms"
                    Latex {
                        width: parent.width * 0.7
                        text: "$$ V_{3}(\\mathbf{r}_{i}, \\mathbf{r}_{j}, \\mathbf{r}_{k})" +
                              " = V_{3}(r_{ij}, r_{ik}, \\theta_{jik})$$"
                    }
                }
                LowerLeftSlide {
                    Image {
                        anchors.fill: parent
                        anchors.margins: parent.width * 0.1
                        fillMode: Image.PreserveAspectFit
                        source: "../../images/trimer-ijk.png"
                        antialiasing: true
                        smooth: true
                    }
                }
            },
            Item {
                anchors.fill: parent
                UpperRightSlide {
                    title: "Kohen-Tully-Stillinger"
                    Latex {
                        text: "\\begin{equation*}
                          h(r_{ji}, r_{ik}, \\theta_{ijk})
                          =
                          \\left \\{
                          \\begin{array}{ll}
                              \\lambda_{ijk} a
                              \\exp
                              \\left(
                                \\dfrac{\\gamma_{ij(k)}^{3}}{r_{ji} - r_{0}} + \\dfrac{\\gamma_{(i)jk}}{r_{jk} - r_{0}}
                              \\right),
                            &
                            r_{ij}, r_{ik} < r_{0}
                            \\\\
                            0
                            &
                            \\text{otherwise}.
                          \\end{array}
                          \\right .
                        \\end{equation*}
                        \\begin{equation*}
                          a = \\left(1 + \\mu_{ijk} \\cos \\theta_{ijk} + \\nu_{ijk} (\\cos \\theta_{ijk})^{2} \\right)
                        \\end{equation*}"
                    }
                }
                LowerRightSlide {
                    BorderedImage {
                        anchors {
                            left: parent.left
                            right: parent.right
                            bottom: v2plusv3.top
                            top: parent.top
                        }
                        source: "../../images/kohen-tully-stillinger.png"
                    }
                    Latex {
                        id: v2plusv3
                        anchors {
                            bottom: parent.bottom
                            centerIn: undefined
                            horizontalCenter: parent.horizontalCenter
                        }
                        width: parent.width * 0.1
                        text: "$V_2 + V_3$"
                    }
                }
            }
        ]
    }

    MultiSlide {
        UpperLeftSlide {
            title: "Advanced Potentials:\nReaxFF (9+ terms)"
            Latex {
                text: "\\begin{equation*}
                        \\begin{split}
                          V
                          = & ~
                          V_{\\text{bond}} + V_{\\text{over}} + V_{\\text{under}} + V_{\\text{penalty}} + V_{\\text{valence}} +
                          \\\\
                          & ~ V_{\\text{torsion}} + V_{\\text{conj}} + V_{\\text{van der Waals}} + V_{\\text{Coulomb}}
                        \\end{split}
                        \\end{equation*}"
            }
        }
        LowerLeftSlide {
        }
    }

    MultiSlide {
        delayedContent: [
            UpperLeftSlide {
                title: "Demo: Argon Crystallization"
                centeredText: "Boiling argon\n" +
                              "cooled slowly.\n\n" +
                              "Lennard-Jones potential."
            },
            LowerLeftSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/argon-crystallization-focus-blur.png"
                }
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


    MultiSlide {
        delayedContent: [
            UpperLeftSlide {
                title: "Computational Quantum Mechanics\nof Atomic Systems"
                centeredText: "Solving the Schrödinger equation\nfor nuclei and electrons."
            },
            UpperRightSlide {
                title: "Schrödinger equation"
                Latex {
                    width: parent.width * 0.3
                    text: "$$H\\Psi = E\\Psi$$"
                }
            },
            LowerRightSlide {
                title: "Hamiltonian"
                Latex {
                    width: parent.width
                    text: "\\begin{align*}
                          H
                          = &
                          - \\sum_{i}^{N}
                          \\frac{1}{2} \\nabla_{r_i}^2 - \\sum_{n}^{N_n} \\frac{1}{2m_p} \\nabla_{R_i}^2 +
                          \\sum_{n<m}^{N_n}
                          \\frac{Z_n Z_m}{|\\mathbf R_n - \\mathbf R_m|} \\\\
                          &- \\frac{1}{2} \\sum_{i}^{N} \\sum_{n}^{N_n} \\frac{Z_n}{|\\mathbf r_i -
                          \\mathbf
                          R_n|}
                          + \\sum_{i<j}^{N} \\frac{1}{|\\mathbf r_i - \\mathbf r_j|}
                        \\end{align*}"
                }
            }
        ]
    }

    // TODO Cutoff, backup slides, Hamiltonian

    MultiSlide {
        delayedContent: [
            Item {
                anchors.fill: parent
                UpperLeftSlide {
                    title: "Born-Oppenheimer"
                    Latex {
                        width: parent.width * 0.9
                        text: "\\begin{equation*}
                              H
                              =
                              - \\sum_{i}^{N} \\frac{1}{2} \\nabla_{r_i}^2
                              - \\frac{1}{2} \\sum_{i}^{N} \\sum_{n}^{N_n} \\frac{Z_n}{|\\mathbf r_i - \\mathbf R_n|}
                              + \\sum_{i<j}^{N} \\frac{1}{|\\mathbf r_i - \\mathbf r_j|}
                            \\end{equation*}"
                    }
                }
                LowerLeftSlide {
                    centeredText: "Nuclei are treated classically.\n" +
                                  "Argued for by mass difference."
                }
            },
            Item {
                anchors.fill: parent
                UpperRightSlide {
                    title: "Slater Determinant"
                    Latex {
                        width: parent.width * 0.9
                        text: "$$\\Psi = \\frac{1}{\\sqrt{{N}!}}
                                \\left|
                                \\begin{array}{cccc}
                                  \\psi_{{1}} (\\mathbf x_{1}) & \\psi_{{1}} (\\mathbf x_{2}) & \\cdots & \\psi_{{1}} (\\mathbf
                                  x_{N})
                                  \\\\
                                  \\psi_{{2}} (\\mathbf x_{1}) & \\psi_{{2}} (\\mathbf x_{2}) & \\cdots & \\psi_{{2}} (\\mathbf
                                  x_{N})
                                  \\\\
                                  \\vdots & \\vdots & \\ddots & \\vdots
                                  \\\\
                                  \\psi_{{N}} (\\mathbf x_{1}) & \\psi_{{N}} (\\mathbf x_{2}) & \\cdots &
                                  \\psi_{{N}} (\\mathbf x_{N})
                                \\end{array}
                                \\right|$$"
                    }
                }
                LowerRightSlide {
                    centeredText: "Single-particle wave functions.\n" +
                                  "No correlations apart from exchange.\n"
                    // +
                    //                                  "Leads to molecular orbital theory."
                }
            }
        ]
    }

    MultiSlide {
        UpperLeftSlide {
            title: "Hartree-Fock Method"
            centeredText: "Self-consistent.\n" +
                          "Iterative scheme."
        }
        LowerLeftSlide {
            title: "Hartree-Fock Equations"
            Latex {
                text: "
                        \\begin{align*}
                        \\mathcal{F} \\psi_{k} &= \\epsilon_{k} \\psi_{k} \\\\
                        \\phi_{k}(\\mathbf r) &= \\sum_{p}^{M} C_{pk} \\varphi_{p}(\\mathbf r) \\\\
                        \\mathbf F \\mathbf C_{k} &= \\epsilon_{k} \\mathbf S \\mathbf C_{k}
                        \\end{align*}
                      "
                width: parent.width * 0.4
                anchors.bottom: parent.bottom
            }
        }

        Image {
            anchors {
                right: parent.right
                top: parent.top
                bottom: parent.bottom
                left: parent.horizontalCenter
                margins: parent.height * 0.02
            }

            fillMode: Image.PreserveAspectFit
            source: "../../images/hf-flow-simple.png"
            antialiasing: true
            smooth: true
        }
    }

    MultiSlide {
        delayedContent: [
            UpperLeftSlide {
                title: "Electron Density"
                centeredText: "Demo!"
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

    MultiSlide {
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

    MultiSlide {
        delayedContent: [
            Item {
                anchors.fill: parent
                UpperLeftSlide {
                    title: "Path to Molecular Dynamics"
                    centeredText: "Electronic energy in quantum mechanics\n" +
                                  "corresponds to potential energy\n" +
                                  "in molecular dynamics."
                }
                LowerLeftSlide {
                    Latex {
                        width: parent.width * 0.35
                        text: "$$V_{\\text{MD}} = E_{\\text{QM}}$$"
                    }
                }
            },
            Item {
                anchors.fill: parent
                UpperRightSlide {
                    title: "Form of the Potential?"
                    centeredText: "Search and fitting can be laborious."
                }
                LowerRightSlide {
                    BorderedImage {
                        anchors {
                            left: parent.left
                            right: parent.right
                            top: parent.top
                            bottom: o2Title.top
                        }
                        source: "../../images/neural_uhf_O2_comparison.png"
                    }
                    Latex {
                        id: o2Title
                        anchors {
                            centerIn: undefined
                            horizontalCenter: parent.horizontalCenter
                            bottom: parent.bottom
                        }
                        width: parent.width * 0.05
                        text: "$O_2$"
                    }
                }
            }
        ]
    }

    // -----------------------------------------------
    // --------------- Neural networks ---------------
    // -----------------------------------------------


    UpperLeftSlide {
        Heading {
            text: "Artificial\nNeural Networks"
        }
    }

    MultiSlide {
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

    MultiSlide {
        delayedContent: [
            Item {
                anchors.fill: parent
                UpperLeftSlide {
                    title: "Training"
                    centeredText: "Backpropagation"
                }
                LowerLeftSlide {
                    Image {
                        anchors.fill: parent
                        source: "../../images/network.png"
                        fillMode: Image.PreserveAspectFit
                        antialiasing: true
                        smooth: true
                    }
                }
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

    MultiSlide {
        delayedContent: [
            UpperLeftSlide {
                title: "Approximating potentials"
                centeredText: "Calculate energy for configurations.\n" +
                              "Train network.\n" +
                              "Plot result."
            },
            UpperRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/neural-approximation-h2.png"
                }
            },
            LowerRightSlide {
                BorderedImage {
                    anchors.fill: parent
                    source: "../../images/neural-approximation-h3.png"
                }
            }
        ]
    }

    // -----------------------------------------------
    // --------------- Neural networks ---------------
    // -----------------------------------------------


    UpperLeftSlide {
        Heading {
            text: "Hydrogen Molecules:\n" +
                  "Results of the Complete Workflow"
        }
    }

    MultiSlide {
        delayedContent: [
            Item {
                anchors.fill: parent

                UpperLeftSlide {
                    title: "Results of the Complete Workflow"
                    centeredText: "Hydrogen molecules!"
                }
                LowerLeftSlide {
                    BorderedImage {
                        anchors.fill: parent
                        source: "../../images/hydrogen-molecules-large-spheres-light-blue.png"
                    }
                }
            },
            UpperRightSlide {
                title: "The price?"
                centeredText: "10-20 times as expensive."
            }
        ]
    }

    MultiSlide {
        UpperLeftSlide {
            title: "Hydrogen Dissociation"
            Latex {
                width: parent.width * 0.6
                text: "Radial distribution $g(r)$ at 156 K."
            }
        }

        LowerLeftSlide {
            title: "ANN"
            BorderedImage {
                anchors.fill: parent
                source: "../../images/dissociation-plot-156K.png"
            }
        }

        LowerRightSlide {
            title: "Kohen-Tully-Stillinger"
            BorderedImage {
                anchors.fill: parent
                source: "../../images/skorpa-radial.png"
            }
        }
    }

    MultiSlide {
        UpperLeftSlide {
            title: "Conclusion"
            bullets: ["Potentials for MD from quantum.",
                "Macroscopic properties from MD.",
                "Neural networks for potential approximation.",
                "Less person-hours, more computation time."]
        }
        UpperRightSlide {
            title: "Future Possibilities"
            bullets: ["Implementation of Kohen-Tully-Stillinger.",
                "Test cutoff effects.",
                "Better quantum computations.",
                "Better neural networks.",
                "More advanced systems."]
        }
    }

    // -----------------------------------------------
    // ---------------- Visualization ----------------
    // -----------------------------------------------

    UpperLeftSlide {
        Heading {
            text: "Visualization"
        }
    }

    MultiSlide {
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

    MultiSlide {
        UpperLeftSlide {
            title: "Demo: Virtual Reality"
            centeredText: "Millions of Atoms"
        }
        UpperRightSlide {
            BorderedImage {
                anchors.fill: parent
                source: "../../images/oculusqt3d-3.png"
            }
        }
    }

    UpperLeftSlide {
        centeredText: "Thank you for your attention!"
    }

}

// TODO: Check thesis for more bullets!


